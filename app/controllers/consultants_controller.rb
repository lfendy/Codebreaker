class ConsultantsController < ApplicationController
  def index
    @consultants = Consultant.all
  end

  def generate
    consultants = params[:skill].nil? ?
      generate_without_filter : generate_with_filter(params[:skill])
    @consultants = consultants.sort_by{rand}[0..1]
    render :index
  end

  private

  def generate_with_filter(criteria)
    skill = Skill.find_by_name(criteria)
    unless skill.nil?
      consultants = skill.consultants
    else
      consultants = []
    end
    consultants
  end

  def generate_without_filter
    Consultant.all
  end
end
