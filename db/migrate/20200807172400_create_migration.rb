class CreateMigration < ActiveRecord::Migration[6.0]
  def change
    create_table :migrations do |t|
      t.integer :day_id
      t.integer :new_day_id
      t.belongs_to :task
      t.timestamps
    end
  end
end
