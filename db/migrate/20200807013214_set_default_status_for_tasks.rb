class SetDefaultStatusForTasks < ActiveRecord::Migration[6.0]
  def change
    change_column :tasks, :status, :string, default: "open"
  end
end
