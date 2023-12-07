class AddCourseIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :course, null: false, foreign_key: true
    add_reference :presentations, :course, null: false, foreign_key: true
  end
end
