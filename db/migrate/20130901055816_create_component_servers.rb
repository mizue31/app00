class CreateComponentServers < ActiveRecord::Migration
  def change
    create_table :component_servers do |t|
      t.references :component
      t.references :server

      t.timestamps
    end
    add_index :component_servers, :component_id
    add_index :component_servers, :server_id
  end
end
