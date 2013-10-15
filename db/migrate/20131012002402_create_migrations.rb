class CreateMigrations < ActiveRecord::Migration
  def change
    create_table :migrations do |t|

      t.timestamps
    end
  end
end
