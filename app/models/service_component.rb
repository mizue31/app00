class ServiceComponent < ActiveRecord::Base
  belongs_to :serivce
  belongs_to :component
  # attr_accessible :title, :body
end
