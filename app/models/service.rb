class Service < ActiveRecord::Base
  has_many :service_components
  has_many :components, :through => :service_components
  attr_accessible :name
end
