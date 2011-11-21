require 'spec_helper'

describe ConsultantsController do
  describe "GET index" do
    it "should assign the consultants" do
      Consultant.create(:name=>"David")

      get 'index'
      consultants = assigns[:consultants]
      consultants.should_not be_nil
      consultants.size.should == 1

    end
  end

  describe "GET generate" do
    it "should list two random consultants" do
      (1..5).each do |i|
        Consultant.create(:name => "David" + i.to_s)
      end

      get 'generate'
      consultants = assigns[:consultants]
      consultants.size.should == 2
      # why does assigns.should have(2).consultants
    end

    describe "with skill filter" do
      before :each do
        (1..5).each do |i|
          Consultant.create({
            :name => "David" + i.to_s,
            :skills_attributes => [{:name => 'ruby'}]
          })
        end
      end

      it "should get no consultant if skill doesn't exist" do
        get 'generate', {:skill => "java"}
        consultants = assigns[:consultants]
        consultants.size.should == 0
      end

      it "should get consultants with the relevant skill" do
        get 'generate', {:skill => "ruby"}
        consultants = assigns[:consultants]
        consultants.size.should == 2
        consultants.each do |c|
          c.skills.collect(&:name).should include('ruby')
        end
      end
    end

  end



end
