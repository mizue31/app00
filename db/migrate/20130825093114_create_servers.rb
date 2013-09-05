class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :host_name
      t.string :p_or_v
      t.string :os

      t.timestamps
    end
  end
end
