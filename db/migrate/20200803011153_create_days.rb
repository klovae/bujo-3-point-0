class CreateDays < ActiveRecord::Migration[6.0]
  def change
    create_table :days do |t|
      t.datetime :date
      t.belongs_to :user
      t.timestamps
    end
  end
end
