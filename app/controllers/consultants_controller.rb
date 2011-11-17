class ConsultantsController < ApplicationController
  def index
    @consultants = Consultant.all
  end
end
