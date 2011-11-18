require 'spec_helper'
require 'csv_parser'

describe ImportCsvController do
  describe "upload csv" do

    it 'should parse the csv file' do
      CSVParser.should_receive(:parse).with("haha").and_return([])
      post 'upload', {:dump => {:file => "haha" }}
    end

    it "should create the same number of consultants that was parsed" do
      hashes = [{}, {}]
      CSVParser.stub(:parse).and_return(hashes)
      Consultant.should_receive(:create).twice
      post 'upload', {:dump => {:file => "haha" }}
    end

    it "should create consultants with the parsed attributes" do
      hashes = [{:key=>nil}]
      CSVParser.stub(:parse).and_return(hashes)
      Consultant.should_receive(:create).with(hashes.first)
      post 'upload', {:dump => {:file => "haha" }}
    end
  end

end
