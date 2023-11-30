require "application_system_test_case"

class SurveysTest < ApplicationSystemTestCase
  setup do
    @survey = surveys(:one)
  end

  test "visiting the index" do
    visit surveys_url
    assert_selector "h1", text: "Surveys"
  end

  test "should create survey" do
    visit surveys_url
    click_on "New survey"

    fill_in "Appropriate timing visuals", with: @survey.appropriate_timing_visuals
    fill_in "Clear delivery", with: @survey.clear_delivery
    fill_in "Clear direction intro", with: @survey.clear_direction_intro
    fill_in "Clear topic intro", with: @survey.clear_topic_intro
    fill_in "Comments", with: @survey.comments
    fill_in "Consistent findings", with: @survey.consistent_findings
    fill_in "Easily follow", with: @survey.easily_follow
    fill_in "Effective body language", with: @survey.effective_body_language
    fill_in "Effective visuals", with: @survey.effective_visuals
    fill_in "Enough information", with: @survey.enough_information
    fill_in "Eye contact", with: @survey.eye_contact
    fill_in "Filled time", with: @survey.filled_time
    fill_in "Free from filler", with: @survey.free_from_filler
    fill_in "Good summary conclusion", with: @survey.good_summary_conclusion
    fill_in "Legible visuals", with: @survey.legible_visuals
    fill_in "Logical sequence", with: @survey.logical_sequence
    fill_in "Overall score", with: @survey.overall_score
    fill_in "Presenter clear understanding", with: @survey.presenter_clear_understanding
    fill_in "Proper grammar", with: @survey.proper_grammar
    fill_in "Questions answered", with: @survey.questions_answered
    fill_in "Visuals enhance", with: @survey.visuals_enhance
    click_on "Create Survey"

    assert_text "Survey was successfully created"
    click_on "Back"
  end

  test "should update Survey" do
    visit survey_url(@survey)
    click_on "Edit this survey", match: :first

    fill_in "Appropriate timing visuals", with: @survey.appropriate_timing_visuals
    fill_in "Clear delivery", with: @survey.clear_delivery
    fill_in "Clear direction intro", with: @survey.clear_direction_intro
    fill_in "Clear topic intro", with: @survey.clear_topic_intro
    fill_in "Comments", with: @survey.comments
    fill_in "Consistent findings", with: @survey.consistent_findings
    fill_in "Easily follow", with: @survey.easily_follow
    fill_in "Effective body language", with: @survey.effective_body_language
    fill_in "Effective visuals", with: @survey.effective_visuals
    fill_in "Enough information", with: @survey.enough_information
    fill_in "Eye contact", with: @survey.eye_contact
    fill_in "Filled time", with: @survey.filled_time
    fill_in "Free from filler", with: @survey.free_from_filler
    fill_in "Good summary conclusion", with: @survey.good_summary_conclusion
    fill_in "Legible visuals", with: @survey.legible_visuals
    fill_in "Logical sequence", with: @survey.logical_sequence
    fill_in "Overall score", with: @survey.overall_score
    fill_in "Presenter clear understanding", with: @survey.presenter_clear_understanding
    fill_in "Proper grammar", with: @survey.proper_grammar
    fill_in "Questions answered", with: @survey.questions_answered
    fill_in "Visuals enhance", with: @survey.visuals_enhance
    click_on "Update Survey"

    assert_text "Survey was successfully updated"
    click_on "Back"
  end

  test "should destroy Survey" do
    visit survey_url(@survey)
    click_on "Destroy this survey", match: :first

    assert_text "Survey was successfully destroyed"
  end
end
