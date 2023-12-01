class CreateEvaluations < ActiveRecord::Migration[7.0]
  def change
    create_table :evaluations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :presentation, null: false, foreign_key: true
      #all the survey stuff
      t.integer :clear_topic_intro, null: false
      t.integer :clear_direction_intro, null: false
      t.integer :logical_sequence, null: false
      t.integer :good_summary_conclusion, null: false
      t.integer :enough_information, null: false
      t.integer :free_from_filler, null: false
      t.integer :filled_time, null: false
      t.integer :easily_follow, null: false
      t.integer :presenter_clear_understanding, null: false
      t.integer :consistent_findings, null: false
      t.integer :questions_answered, null: false
      t.integer :effective_visuals, null: false
      t.integer :legible_visuals, null: false
      t.integer :proper_grammar, null: false
      t.integer :visuals_enhance, null: false
      t.integer :appropriate_timing_visuals, null: false
      t.integer :clear_delivery, null: false
      t.integer :effective_body_language, null: false
      t.integer :eye_contact, null: false
      t.integer :overall_score, null: false
      t.text :comments

      t.timestamps
    end
  end
end
