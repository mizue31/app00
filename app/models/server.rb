class Server < ActiveRecord::Base
  has_many :component_servers, :dependent => :destroy
  has_many :server_softwares,  :dependent => :destroy
  has_many :components, :through => :component_servers
  has_many :softwares,  :through => :server_softwares
  accepts_nested_attributes_for :component_servers, :allow_destroy => true, :reject_if => lambda { |attrs| attrs[:component_id].blank? }
  accepts_nested_attributes_for :server_softwares, :allow_destroy => true, :reject_if => lambda { |attrs| attrs[:software_id].blank? }
  attr_accessible :host_name, :p_or_v, :os
  attr_accessible :component_servers_attributes
  attr_accessible :server_softwares_attributes
  validates :host_name, :presence => true, :uniqueness => true

  def self.to_csv(servers)
    headers = %w( id host_name p_or_v os )
    csv_data = CSV.generate(headers: headers, write_headers: true, force_quotes: true) do |csv|
      enum = if servers.is_a?(Array)
        servers.each
      else
        Enumerator.new do |yielder|
          servers.find_in_branches do |records|
            records.each {|record| yielder.yield record }
          end
        end
      end
      enum.each do |server|
        csv << [
          server.id,
          server.host_name,
          server.p_or_v,
          server.os
        ]
      end
    end
    csv_data.encode(Encoding::SJIS)
  end
end
