class DropSurveyModel < ActiveRecord::Migration[7.0]
  def change
    drop_table :surveys
  end
end
