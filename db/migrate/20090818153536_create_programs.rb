class CreatePrograms < ActiveRecord::Migration
  def self.up
    create_table :programs do |t|
      t.integer :meal_id
      t.integer :condition_id

      t.timestamps
    end
  end

  def self.down
    drop_table :programs
  end
end
