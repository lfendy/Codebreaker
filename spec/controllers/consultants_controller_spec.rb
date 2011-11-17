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

end
