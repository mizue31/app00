class Component < ActiveRecord::Base
  has_many :service_components, :dependent => :destroy
  has_many :component_servers, :dependent => :destroy
  has_many :services, :through => :service_components
  has_many :servers, :through => :component_servers
  accepts_nested_attributes_for :service_components, :allow_destroy => true, :reject_if => lambda { |attrs| attrs[service_id].blank? }
  accepts_nested_attributes_for :component_servers, :allow_destroy => true, :reject_if => lambda{ |attrs| attrs[:server_id].blank? }
  attr_accessible :name, :domain
  attr_accessible :component_servers_attributes
  attr_accessible :service_components_attributes
  validates :name, :presence => true, :uniqueness => true
  validates :domain, :inclusion => { :in => ["Application Services","Distributed","Mainframe","Networks","Workplaces","" ] }

  def self.to_csv(components)
    headers = %w( id name )
    csv_data = CSV.generate(headers: headers, write_headers: true, force_quotes: true) do |csv|
      enum = if components.is_a?(Array)
        components.each
      else
        Enumerator.new do |yielder|
          components.find_in_branches do |records|
            records.each {|record| yielder.yield record }
          end
        end
      end
      enum.each do |component|
        csv << [
          component.id,
          component.name
        ]
      end
    end
    csv_data.encode(Encoding::SJIS)
  end
end
