require 'spec_helper'

describe "upload_file" do

  describe "uploads file and populate the database" do
    let(:test_file) do
      fixture_file_upload('/consultants.csv', 'text/plain')
    end

    it "should create entries in database" do
      post 'import_csv', {:dump => {:file => test_file}}
      Consultant.count.should_not == 0
      c = Consultant.find_by_name("David Oh")
      c.should be
      c.role.should == "Dev"
      c.email.should == "doh@thoughtworks.com"
      c.skill.should == "ruby"
      c.grade.should == "Consultant"
    end
  end

end

