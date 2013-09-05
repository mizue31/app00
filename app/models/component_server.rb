class ComponentServer < ActiveRecord::Base
  belongs_to :component
  belongs_to :server
  attr_accessible :server_id, :component_id
end
