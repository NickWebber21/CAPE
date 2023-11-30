class AddFirstLastCourseAndRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first, :string, null: false
    add_column :users, :last, :string, null: false
    add_column :users, :courses, :json
    add_column :users, :role, :string, null: false
  end
end
