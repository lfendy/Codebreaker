require 'spec_helper'

describe "consultants/index.html.erb" do
  it "should display the list of consultants" do
    assign(:consultants, [stub_model(Consultant, :name=> "Chicago", :email=>"chicago@thoughtworks.com", :role=>"Dev", :grade=>"Consultant", :skill=>"Ruby")])
    render
    rendered.should contain("Chicago")
    rendered.should contain("chicago@thoughtworks.com")
    rendered.should contain("Dev")
    rendered.should contain("Consultant")
    rendered.should contain("Ruby")
  end

end
