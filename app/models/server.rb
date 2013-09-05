class Server < ActiveRecord::Base
  has_many :component_servers
  has_many :server_softwares, :dependent => :destroy
  has_many :components, :through => :component_servers
  has_many :softwares, :through => :server_softwares
  accepts_nested_attributes_for :component_servers
  accepts_nested_attributes_for :server_softwares, :allow_destroy => true, :reject_if => lambda { |attrs| attrs[:software_id].blank? }
  attr_accessible :host_name, :p_or_v, :os
  attr_accessible :component_servers_attributes
  attr_accessible :server_softwares_attributes
  validates :host_name, :presence => true, :uniqueness => true
end
