require 'csv_parser'

class ImportCsvController < ApplicationController
  def upload
    CSVParser.parse params[:dump][:file]
    redirect_to :action => :index
  end
end
