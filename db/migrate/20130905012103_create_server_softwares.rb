class CreateServerSoftwares < ActiveRecord::Migration
  def change
    create_table :server_softwares do |t|
      t.references :server
      t.references :software

      t.timestamps
    end
    add_index :server_softwares, :server_id
    add_index :server_softwares, :software_id
  end
end
