class CreateSoftwares < ActiveRecord::Migration
  def change
    create_table :softwares do |t|
      t.string :maker
      t.string :sw_name
      t.string :version
      t.date :eos_date

      t.timestamps
    end
  end
end
