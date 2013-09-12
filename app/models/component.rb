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
end
