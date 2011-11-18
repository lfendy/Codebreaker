class ConsultantsController < ApplicationController
  def index
    @consultants = Consultant.all
  end

  def generate
    @consultants = Consultant.all.sort_by{rand}[0..1]
    render :index
  end
end
