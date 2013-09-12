class CreateServiceComponents < ActiveRecord::Migration
  def change
    create_table :service_components do |t|
      t.references :service
      t.references :component

      t.timestamps
    end
    add_index :service_components, :service_id
    add_index :service_components, :component_id
  end
end
