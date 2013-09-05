class Software < ActiveRecord::Base
  has_many :server_softwares
  has_many :servers, :through => :server_softwares
  accepts_nested_attributes_for :server_softwares
  attr_accessible :id, :eos_date, :maker, :sw_name, :version
  attr_accessible :server_softwares_attributes
end
