class AddDateToPresentation < ActiveRecord::Migration[7.0]
  def change
    add_column :presentations, :due_date, :date, null: false

  end
end
