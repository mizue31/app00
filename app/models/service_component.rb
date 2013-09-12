class ServiceComponent < ActiveRecord::Base
  belongs_to :service
  belongs_to :component
  attr_accessible :service_id, :component_id
end
