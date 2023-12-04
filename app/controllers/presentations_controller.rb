class PresentationsController < ApplicationController
  before_action :set_presentation, only: %i[ show edit update destroy ]

  # GET /presentations or /presentations.json
  def index
    @presentations = Presentation.all

    @authors = Author.all

  end

  # GET /presentations/1 or /presentations/1.json
  def show
    @authors = Author.all
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

    delete_authors

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
end
