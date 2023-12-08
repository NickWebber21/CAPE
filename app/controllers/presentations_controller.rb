class PresentationsController < ApplicationController
  before_action :set_presentation, only: %i[ show edit update destroy ]
  load_and_authorize_resource

  # GET /presentations or /presentations.json
  def index
    @presentations = Presentation.all

    # Get both the user's presentations and the other presentations.
    @user_presentations = Author.where(user_id: current_user.id).map(&:presentation)
    @other_presentations = Presentation.where.not(id: @user_presentations.map(&:id))
    
    @authors = Author.all
  end

  # GET /presentations/1 or /presentations/1.json
  def show
    @authors = Author.all

    # Get the evaluations for the presentation.
    @evaluations = Evaluation.where(presentation_id: @presentation.id)

    # Get the average of each attribute for the presentation.
    @attribute_averages = calculate_attribute_averages([@presentation])

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
  end

  # GET /presentations/new
  def new
    @presentation = Presentation.new

    # Find all users that are in the same course as the current user
    @users = User.where(courses: current_user.courses)

    # Initialize selected authors to empty array
    @selected_authors = []
  end

  # GET /presentations/1/edit
  def edit
    # Find all users that are in the same course as the current user
    @users = User.where(courses: current_user.courses)

    # Find all authors for the presentation
    @selected_authors = Author.where(presentation_id: @presentation.id).pluck(:user_id)
  end

  # POST /presentations or /presentations.json
  def create
    @presentation = Presentation.new(presentation_params)

    respond_to do |format|
      if @presentation.save
        create_authors
        format.html { redirect_to presentation_url(@presentation), notice: "Presentation was successfully created." }
        format.json { render :show, status: :created, location: @presentation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @presentation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /presentations/1 or /presentations/1.json
  def update
    respond_to do |format|
      if @presentation.update(presentation_params)
        update_selected_authors
        format.html { redirect_to presentation_url(@presentation), notice: "Presentation was successfully updated." }
        format.json { render :show, status: :ok, location: @presentation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @presentation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presentations/1 or /presentations/1.json
  def destroy
    @presentation.destroy
    
    respond_to do |format|
      format.html { redirect_to presentations_url, notice: "Presentation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presentation
      @presentation = Presentation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def presentation_params
      params.require(:presentation).permit(:title, :course, :due_date, :grade, :selected_authors => [])
    end

    # Update the selected authors for a presentation.
    def update_selected_authors
      delete_authors
      create_authors
    end

    # Delete all authors for a specific presentation.
    def delete_authors
      # Get the list of authors that the user selected.
      authors_to_stay = presentation_params[:selected_authors]

      # If no authors were selected, then delete all authors for the presentation.
      if authors_to_stay.blank?
        Author.where(presentation_id: @presentation.id).destroy_all
      else
        # Delete from the authors model all authors that are not in the list of selected authors.
        Author.where(presentation_id: @presentation.id).each do |author|
          unless authors_to_stay.include? author.user_id
            author.destroy
          end
        end
      end
    end

    # Create an author for each selected user
    def create_authors
      @presentation.selected_authors.each do |user_id|
        Author.create(user_id: user_id, presentation_id: @presentation.id)
      end
    end

    def calculate_attribute_averages(presentations)
      averages = {}

      # Get the numeric attributes dynamically from the database columns
      numeric_attributes = Evaluation.columns_hash.select { |_, column| [:integer, :float].include?(column.type) }.keys
      numeric_attributes -= ['user_id', 'presentation_id', 'comments', 'id']

      presentations.each do |presentation|
        averages[presentation] = {}
        numeric_attributes.each do |attribute|
          averages[presentation][attribute] = presentation.evaluations.average(attribute) || 0
        end
        averages[presentation]['evaluation_count'] = presentation.evaluations.count
      end
    
      averages
    end
end
