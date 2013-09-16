class Service < ActiveRecord::Base
  has_many :service_components, :dependent => :destroy
  has_many :components, :through => :service_components
  accepts_nested_attributes_for :service_components, :allow_destroy => true, :reject_if => lambda{ |attrs| attrs[:component_id].blank? }
  attr_accessible :name
  attr_accessible :sid
  attr_accessible :code
  attr_accessible :description
  attr_accessible :service_components_attributes
  validates :name, :presence => true, :uniqueness => true

  def self.to_csv(services)
    headers = %w( id name sid code desc )
    csv_data = CSV.generate(headers: headers, write_headers: true, force_quotes: true) do |csv|
      enum = if services.is_a?(Array)
        services.each
      else
        Enumerator.new do |yielder|
          services.find_in_branches do |records|
            records.each {|record| yielder.yield record }
          end
        end
      end
      enum.each do |service|
        csv << [
          service.id,
          service.name,
          service.name,
          service.sid,
          service.code,
          service.description
        ]
      end
    end
    csv_data.encode(Encoding::SJIS)
  end

  def self.import(file)
    CSV.foreach(file.path, {quote_char: '"', headers: true}) do |row|
      service = find_by_id(row["id"]) || new
      service.attributes = row.to_hash.slice(*accessible_attributes)
      service.save!
    end
  end

end
