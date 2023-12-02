class AddSurveyFieldsToEvaluations < ActiveRecord::Migration[7.0]
  def change
    add_column :evaluations, :clear_topic_intro, :integer, null: false
    add_column :evaluations, :clear_direction_intro, :integer, null: false
    add_column :evaluations, :logical_sequence, :integer, null: false
    add_column :evaluations, :good_summary_conclusion, :integer, null: false
    add_column :evaluations, :enough_information, :integer, null: false
    add_column :evaluations, :free_from_filler, :integer, null: false
    add_column :evaluations, :filled_time, :integer, null: false
    add_column :evaluations, :easily_follow, :integer, null: false
    add_column :evaluations, :presenter_clear_understanding, :integer, null: false
    add_column :evaluations, :consistent_findings, :integer, null: false
    add_column :evaluations, :questions_answered, :integer, null: false
    add_column :evaluations, :effective_visuals, :integer, null: false
    add_column :evaluations, :legible_visuals, :integer, null: false
    add_column :evaluations, :proper_grammar, :integer, null: false
    add_column :evaluations, :visuals_enhance, :integer, null: false
    add_column :evaluations, :appropriate_timing_visuals, :integer, null: false
    add_column :evaluations, :clear_delivery, :integer, null: false
    add_column :evaluations, :effective_body_language, :integer, null: false
    add_column :evaluations, :eye_contact, :integer, null: false
    add_column :evaluations, :overall_score, :integer, null: false
    add_column :evaluations, :comments, :text
  end
end
