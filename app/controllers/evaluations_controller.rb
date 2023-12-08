class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: %i[ show edit update destroy ]
  load_and_authorize_resource

  # GET /evaluations or /evaluations.json
  def index
    # Get all evaluations for the user.
    @user_evaluations = Evaluation.where(user_id: current_user.id)

    # Get the presentations that the user has authored.
    user_authors = Author.where(user_id: current_user.id)
    @user_presentations = user_authors.map(&:presentation)
    @evaluations_of_user_presentations = Evaluation.where(presentation_id: @user_presentations.map(&:id))

    @evaluations = Evaluation.all
  end

  # GET /evaluations/1 or /evaluations/1.json
  def show
    # Pass in the full label for each attribute.
    @attribute_labels = {
      "clear_topic_intro" => "The introduction gave me a clear idea of the topic.",
      "clear_direction_intro" => "The introduction gave me a clear idea of the direction the presentation would take.",
      "logical_sequence" => "The presentation presented information in a logical, interesting sequence.",
      "good_summary_conclusion" => "The conclusion did a good job of summarizing the content of the presentation.",
      "enough_information" => "Enough essential information was given to allow me to effectively evaluate the topic.",
      "free_from_filler" => "The presentation was free from irrelevant or filler information.",
      "filled_time" => "The presentation filled the time allotted.",
      "easily_follow" => "I could easily follow the main points of the presentation.",
      "presenter_clear_understanding" => "The presenter had a clear understanding of the material presented.",
      "consistent_findings" => "The plans, recommendations, and/or conclusions are consistent with the findings.",
      "questions_answered" => "Presenter answers all questions with explanations and elaboration.",
      "effective_visuals" => "The visuals were effective in enhancing the message.",
      "legible_visuals" => "The visuals were legible and easy to read.",
      "proper_grammar" => "Visuals were free from grammar and formatting errors.",
      "visuals_enhance" => "The number of visual aids enhanced the presentation.",
      "appropriate_timing_visuals" => "The visuals were displayed for an appropriate time and had no annoying transition effect.",
      "clear_delivery" => "The presenter spoke clearly, was easily heard, and maintained an appropriate talking rate.",
      "effective_body_language" => "The presenter maintained a good posture and made effective use of hand and body gesture.",
      "eye_contact" => "The presenter maintained eye contact with the audience.",
      "overall_score" => "Overall Score"
    }

    # Pass in the value for each attribute.
    @attribute_values = {
      "clear_topic_intro" => @evaluation.clear_topic_intro,
      "clear_direction_intro" => @evaluation.clear_direction_intro,
      "logical_sequence" => @evaluation.logical_sequence,
      "good_summary_conclusion" => @evaluation.good_summary_conclusion,
      "enough_information" => @evaluation.enough_information,
      "free_from_filler" => @evaluation.free_from_filler,
      "filled_time" => @evaluation.filled_time,
      "easily_follow" => @evaluation.easily_follow,
      "presenter_clear_understanding" => @evaluation.presenter_clear_understanding,
      "consistent_findings" => @evaluation.consistent_findings,
      "questions_answered" => @evaluation.questions_answered,
      "effective_visuals" => @evaluation.effective_visuals,
      "legible_visuals" => @evaluation.legible_visuals,
      "proper_grammar" => @evaluation.proper_grammar,
      "visuals_enhance" => @evaluation.visuals_enhance,
      "appropriate_timing_visuals" => @evaluation.appropriate_timing_visuals,
      "clear_delivery" => @evaluation.clear_delivery,
      "effective_body_language" => @evaluation.effective_body_language,
      "eye_contact" => @evaluation.eye_contact,
      "overall_score" => @evaluation.overall_score
    }
  end

  # GET /evaluations/new
  def new
    @presentation = Presentation.find(params[:presentation_id])
    @submitted_evaluations = Evaluation.where(user_id: current_user.id, presentation_id: @presentation.id)
    @authors = Author.where(presentation_id: @presentation.id, user_id: current_user.id)
    @evaluation = Evaluation.new
  end

  # GET /evaluations/1/edit
  def edit
  end

  # POST /evaluations or /evaluations.json
  def create
    @evaluation = Evaluation.new(evaluation_params)

    respond_to do |format|
      if @evaluation.save
        format.html { redirect_to evaluation_url(@evaluation), notice: "Evaluation was successfully created." }
        format.json { render :show, status: :created, location: @evaluation }
      else
        @presentation = Presentation.find(params[:evaluation][:presentation_id].to_i)
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evaluations/1 or /evaluations/1.json
  def update
    respond_to do |format|
      if @evaluation.update(evaluation_params)
        format.html { redirect_to evaluation_url(@evaluation), notice: "Evaluation was successfully updated." }
        format.json { render :show, status: :ok, location: @evaluation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluations/1 or /evaluations/1.json
  def destroy
    @evaluation.destroy

    respond_to do |format|
      format.html { redirect_to evaluations_url, notice: "Evaluation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluation
      @evaluation = Evaluation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def evaluation_params
      params.require(:evaluation).permit(
        :user_id, :presentation_id,
        :clear_topic_intro, :clear_direction_intro, :logical_sequence,
        :good_summary_conclusion, :enough_information, :free_from_filler,
        :filled_time, :easily_follow, :presenter_clear_understanding,
        :consistent_findings, :questions_answered, :effective_visuals,
        :legible_visuals, :proper_grammar, :visuals_enhance,
        :appropriate_timing_visuals, :clear_delivery, :effective_body_language,
        :eye_contact, :overall_score, :comments
      )
    end
end
