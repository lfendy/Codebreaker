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
      consultants.should_not be_nil
      consultants.size.should == 2
    end
  end


end
