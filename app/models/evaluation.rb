class Evaluation < ApplicationRecord
  validates :clear_topic_intro, :clear_direction_intro, :logical_sequence, :good_summary_conclusion, :enough_information, :free_from_filler, :filled_time, :easily_follow, :presenter_clear_understanding, :consistent_findings, :questions_answered, :effective_visuals, :legible_visuals, :proper_grammar, :visuals_enhance, :appropriate_timing_visuals, :clear_delivery, :effective_body_language, :eye_contact, :overall_score, presence: true  

  belongs_to :user
  belongs_to :presentation
end
