class ServerSoftware < ActiveRecord::Base
  belongs_to :server
  belongs_to :software
  attr_accessible :server_id, :software_id
end
