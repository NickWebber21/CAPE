class RemoveSurveyReferenceFromEvaluations < ActiveRecord::Migration[7.0]
  def change
    remove_reference :evaluations, :survey, null: false, foreign_key: true
  end
end
