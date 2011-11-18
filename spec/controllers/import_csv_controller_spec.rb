require 'spec_helper'
require 'csv_parser'

describe ImportCsvController do
  describe "upload csv" do
    before :each do
      file = ""
      file.stub(:read).and_return("haha")
      controller.stub!(:params).and_return({
        :dump => {:file => file}
      })
    end

    it 'should parse the csv file' do
      CSVParser.should_receive(:parse).with("haha").and_return([])
      post 'upload'
    end

    it "should create the same number of consultants that was parsed" do
      hashes = [{}, {}]
      CSVParser.stub(:parse).and_return(hashes)
      Consultant.should_receive(:create).twice
      post 'upload'
    end

    it "should create consultants with the parsed attributes" do
      hashes = [{:key=>nil}]
      CSVParser.stub(:parse).and_return(hashes)
      Consultant.should_receive(:create).with(hashes.first)
      post 'upload'
    end
  end

end
