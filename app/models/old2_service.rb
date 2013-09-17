class Service < ActiveRecord::Base
  has_many :service_components, :dependent => :destroy
  has_many :components, :through => :service_components
  accepts_nested_attributes_for :service_components, :allow_destroy => true, :reject_if => lambda{ |attrs| attrs[:component_id].blank? }
  attr_accessible :name
  attr_accessible :sid
  attr_accessible :code
  attr_accessible :description
  attr_accessible :service_components_attributes
  validates :name, :presence => true, :uniqueness => true

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |service|
        csv << service.attributes.values_at(*column_names)
      end
    end
  end

end