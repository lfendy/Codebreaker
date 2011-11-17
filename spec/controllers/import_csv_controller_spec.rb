require 'spec_helper'
require 'csv_parser'

describe ImportCsvController do
  describe "upload csv" do
    it 'should handle the csv file' do
      CSVParser.should_receive(:parse).with("haha")
      post 'upload', {:dump => {:file => "haha" }}
    end
  end

end
