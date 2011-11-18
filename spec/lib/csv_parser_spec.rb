require 'spec_helper'

describe CSVParser do
  describe 'parse' do
    it 'should create a Consultant from a single csv line' do
      consultants = CSVParser.parse 'David Oh,Dev,Consultant,doh@thoughtworks.com,ruby'
      consultants.first.name.should == 'David Oh'
      consultants.first.role.should == 'Dev'
      consultants.first.grade.should == 'Consultant'
      consultants.first.email.should == 'doh@thoughtworks.com'
      consultants.first.skill.should == 'ruby'
      consultants.size.should == 1
    end

    it 'should create Consultants from multiple csv lines' do
      str = <<TAG
        David
        Pei Shi
        Weiwei
        Fendy
TAG
      consultants = CSVParser.parse str
      consultants.size.should == 4
    end

  end

end

