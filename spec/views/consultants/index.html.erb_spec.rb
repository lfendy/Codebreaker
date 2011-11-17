require 'spec_helper'

describe "consultants/index.html.erb" do
  it "should display the list of consultants" do
    assign(:consultants, [stub_model(Consultant, :name=> "Chicago")])
    render
    rendered.should contain("Chicago")
  end
end
