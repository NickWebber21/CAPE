class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @all_presentations = Presentation.all
      @user_presentations = Author.where(user_id: current_user.id).map(&:presentation)
      @user_evaluations = Evaluation.where(user_id: current_user.id)

      # Get the presentations that the user has not authored.
      user_presentations_ids = @user_presentations.map(&:id)
      @other_presentations = Presentation.where.not(id: user_presentations_ids).where(course: current_user.course)

      # Get the presentations that the user has not evaluated.
      user_evaluations_ids = current_user.evaluations.map(&:presentation_id)
      @presentations_without_evaluation = Presentation.where.not(id: user_evaluations_ids).where(course: current_user.course).where.not(id: user_presentations_ids)

      @user_attribute_averages = calculate_attribute_averages(@user_presentations)
      @presentations = Presentation.all.includes(:evaluations)
      @attribute_averages = calculate_attribute_averages(@presentations)
    end
  end

  def help
  end

  def about
  end

  private

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
