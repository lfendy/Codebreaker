require 'spec_helper'
describe 'import_csv/index.html.erb' do
  it 'should show a field for uploading csv' do
    render
    rendered.should have_selector("input", :type => "file")
  end

  it 'should have a submit button' do
    render
    rendered.should have_selector("input", {:type => "submit", :value => "Submit"})
  end
end
