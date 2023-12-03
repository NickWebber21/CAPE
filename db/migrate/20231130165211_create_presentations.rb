class CreatePresentations < ActiveRecord::Migration[7.0]
  def change
    create_table :presentations do |t|
      t.string :title, null: false
      t.string :course, null: false
      t.integer :grade, null: true

      t.timestamps
    end
  end
end
