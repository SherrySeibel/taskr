class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.string :user_id, null: false
      t.string :completed, null: false

      t.timestamps null: false
    end

    add_index :tasks, :user_id # Anything with a foreign id should have an index.
  end
end

# current_user.tasks
#
# IS THE SAME AS
#
# Task.where(user_id: current_user.id)
