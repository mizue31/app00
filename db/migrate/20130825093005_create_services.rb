class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :sid
      t.string :code
      t.string :description

      t.timestamps
    end
  end
end
