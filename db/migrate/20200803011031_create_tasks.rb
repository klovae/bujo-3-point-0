class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :content
      t.string :status
      t.belongs_to :user
      t.belongs_to :day
      t.timestamps
    end
  end
end
