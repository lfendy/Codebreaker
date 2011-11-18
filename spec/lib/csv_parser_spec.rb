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
        :skill => 'ruby'
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

end

