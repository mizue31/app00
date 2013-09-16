class Software < ActiveRecord::Base
  has_many :server_softwares
  has_many :servers, :through => :server_softwares
  accepts_nested_attributes_for :server_softwares
  attr_accessible :id, :eos_date, :maker, :sw_name, :version
  attr_accessible :server_softwares_attributes

  def self.to_csv(softwares)
    headers = %w( id sw_name maker version eos_date )
    csv_data = CSV.generate(headers: headers, write_headers: true, force_quotes: true) do |csv|
      enum = if softwares.is_a?(Array)
        softwares.each
      else
        Enumerator.new do |yielder|
          softwares.find_in_branches do |records|
            records.each {|record| yielder.yield record }
          end
        end
      end
      enum.each do |software|
        csv << [
          software.id,
          software.sw_name,
          software.maker,
          software.version,
          software.eos_date
        ]
      end
    end
    csv_data.encode(Encoding::SJIS)
  end
end
