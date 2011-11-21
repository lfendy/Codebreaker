require 'spec_helper'

describe CSVParser do
  describe 'parse' do
    it 'should parse a file with a single csv line' do
      results = CSVParser.parse 'David Oh,Dev,Consultant,doh@thoughtworks.com,ruby'
      results.first.should == {
        :name => 'David Oh',
        :role => 'Dev',
        :grade => 'Consultant',
        :email => 'doh@thoughtworks.com',
        :skills_attributes => [{:name => 'ruby'}]
      }
      results.size.should == 1
    end

    it 'should parse a file with multiple csv lines' do
      str = <<TAG
        David
        Pei Shi
        Weiwei
        Fendy
TAG
      results = CSVParser.parse str
      results.size.should == 4
    end

  end

  describe 'parse skill' do
    it 'should parse pipe delimited string' do
      pipe_delimited ="pipe1|pipe2|pipe3"
      results = CSVParser.parse_skills pipe_delimited
      results.size.should == 3
    end

    it 'should parse skill names' do
      pipe_delimited ="pipe1"
      results = CSVParser.parse_skills pipe_delimited
      results.first.should == {
        :name => 'pipe1'
      }
    end

    it "should not complain on nil" do
      lambda{CSVParser.parse_skills nil}.should_not raise_error
    end
  end


end

