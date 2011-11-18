require 'csv_parser'

class ImportCsvController < ApplicationController
  def upload
    
    consultants = CSVParser.parse((params[:dump][:file]).read)
    consultants.each do |c|
      Consultant.create(c)
    end
    redirect_to :action => :index
  end
end
