require "administrate/base_dashboard"

class EvaluationDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    appropriate_timing_visuals: Field::Number,
    clear_delivery: Field::Number,
    clear_direction_intro: Field::Number,
    clear_topic_intro: Field::Number,
    comments: Field::Text,
    consistent_findings: Field::Number,
    easily_follow: Field::Number,
    effective_body_language: Field::Number,
    effective_visuals: Field::Number,
    enough_information: Field::Number,
    eye_contact: Field::Number,
    filled_time: Field::Number,
    free_from_filler: Field::Number,
    good_summary_conclusion: Field::Number,
    legible_visuals: Field::Number,
    logical_sequence: Field::Number,
    overall_score: Field::Number,
    presentation: Field::BelongsTo,
    presenter_clear_understanding: Field::Number,
    proper_grammar: Field::Number,
    questions_answered: Field::Number,
    user: Field::BelongsTo,
    visuals_enhance: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    user
    presentation
    overall_score
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    user
    presentation
    appropriate_timing_visuals
    clear_delivery
    clear_direction_intro
    clear_topic_intro
    consistent_findings
    easily_follow
    effective_body_language
    effective_visuals
    enough_information
    eye_contact
    filled_time
    free_from_filler
    good_summary_conclusion
    legible_visuals
    logical_sequence
    presenter_clear_understanding
    proper_grammar
    visuals_enhance
    overall_score
    comments
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    user
    presentation
    appropriate_timing_visuals
    clear_delivery
    clear_direction_intro
    clear_topic_intro
    consistent_findings
    easily_follow
    effective_body_language
    effective_visuals
    enough_information
    eye_contact
    filled_time
    free_from_filler
    good_summary_conclusion
    legible_visuals
    logical_sequence
    presenter_clear_understanding
    proper_grammar
    questions_answered
    visuals_enhance
    overall_score
    comments
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how evaluations are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(evaluation)
  #   "Evaluation ##{evaluation.id}"
  # end
end
