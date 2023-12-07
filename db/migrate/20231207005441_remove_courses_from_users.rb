class RemoveCoursesFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :courses, :string
    remove_column :presentations, :course, :string
   
  end
end
