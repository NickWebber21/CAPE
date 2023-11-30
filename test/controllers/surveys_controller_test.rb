require "test_helper"

class SurveysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @survey = surveys(:one)
  end

  test "should get index" do
    get surveys_url
    assert_response :success
  end

  test "should get new" do
    get new_survey_url
    assert_response :success
  end

  test "should create survey" do
    assert_difference("Survey.count") do
      post surveys_url, params: { survey: { appropriate_timing_visuals: @survey.appropriate_timing_visuals, clear_delivery: @survey.clear_delivery, clear_direction_intro: @survey.clear_direction_intro, clear_topic_intro: @survey.clear_topic_intro, comments: @survey.comments, consistent_findings: @survey.consistent_findings, easily_follow: @survey.easily_follow, effective_body_language: @survey.effective_body_language, effective_visuals: @survey.effective_visuals, enough_information: @survey.enough_information, eye_contact: @survey.eye_contact, filled_time: @survey.filled_time, free_from_filler: @survey.free_from_filler, good_summary_conclusion: @survey.good_summary_conclusion, legible_visuals: @survey.legible_visuals, logical_sequence: @survey.logical_sequence, overall_score: @survey.overall_score, presenter_clear_understanding: @survey.presenter_clear_understanding, proper_grammar: @survey.proper_grammar, questions_answered: @survey.questions_answered, visuals_enhance: @survey.visuals_enhance } }
    end

    assert_redirected_to survey_url(Survey.last)
  end

  test "should show survey" do
    get survey_url(@survey)
    assert_response :success
  end

  test "should get edit" do
    get edit_survey_url(@survey)
    assert_response :success
  end

  test "should update survey" do
    patch survey_url(@survey), params: { survey: { appropriate_timing_visuals: @survey.appropriate_timing_visuals, clear_delivery: @survey.clear_delivery, clear_direction_intro: @survey.clear_direction_intro, clear_topic_intro: @survey.clear_topic_intro, comments: @survey.comments, consistent_findings: @survey.consistent_findings, easily_follow: @survey.easily_follow, effective_body_language: @survey.effective_body_language, effective_visuals: @survey.effective_visuals, enough_information: @survey.enough_information, eye_contact: @survey.eye_contact, filled_time: @survey.filled_time, free_from_filler: @survey.free_from_filler, good_summary_conclusion: @survey.good_summary_conclusion, legible_visuals: @survey.legible_visuals, logical_sequence: @survey.logical_sequence, overall_score: @survey.overall_score, presenter_clear_understanding: @survey.presenter_clear_understanding, proper_grammar: @survey.proper_grammar, questions_answered: @survey.questions_answered, visuals_enhance: @survey.visuals_enhance } }
    assert_redirected_to survey_url(@survey)
  end

  test "should destroy survey" do
    assert_difference("Survey.count", -1) do
      delete survey_url(@survey)
    end

    assert_redirected_to surveys_url
  end
end
