class CreateServiceComponents < ActiveRecord::Migration
  def change
    create_table :service_components do |t|

      t.integer "service_id"
      t.integer "component_id"

      t.timestamps
    end
  end
end
