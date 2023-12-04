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
  end

  # GET /presentations/1/edit
  def edit
    # Find all users that are in the same course as the current user
    @users = User.where(courses: current_user.courses)
  end

  # POST /presentations or /presentations.json
  def create
    @presentation = Presentation.new(presentation_params)

    respond_to do |format|
      if @presentation.save

        # Create an author for each selected user
        @presentation.selected_authors.each do |user_id|
          Author.create(user_id: user_id, presentation_id: @presentation.id)
        end

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
end
