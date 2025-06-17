class AddUserToTasks < ActiveRecord::Migration[8.0]
  def up
    # First add the column as nullable
    add_reference :tasks, :user, null: true, foreign_key: true

    # Create a default admin user if none exists
    User.create!(email: 'admin@example.com', password: 'password123', role: 'admin') if User.none?

    # Assign all existing tasks to the first user
    first_user = User.first
    execute <<-SQL
      UPDATE tasks SET user_id = #{first_user.id}
    SQL

    # Now make the column non-nullable
    change_column_null :tasks, :user_id, false
  end

  def down
    remove_reference :tasks, :user
  end
end
