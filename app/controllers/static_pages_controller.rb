class StaticPagesController < ApplicationController
  def home
    @presentations = Presentation.all.includes(:evaluations)
    @attribute_averages = calculate_attribute_averages(@presentations)
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
    numeric_attributes -= ['user_id', 'presentation_id', 'comments']
  
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
