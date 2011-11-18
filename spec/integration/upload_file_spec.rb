require 'spec_helper'

describe "upload_file" do
  before :each do
    str = <<TAG
David Oh,Dev,Consultant,doh@thoughtworks.com,ruby
Weiwei Ding,Dev,Consultant,wding@thoughtworks.com,ruby
Liauw Fendy,Dev,Consultant,lfendy@thoughtworks.com,ruby
Pei Shi Yong,Dev,Consultant,pyong@thoughtworks.com,ruby
TAG
    post 'import_csv', {:dump => {:file => str}}
  end

  it "should create the correct number entries in the database" do
    Consultant.count.should== 4
  end

  it "should create consultants with the correct attributes" do
    c = Consultant.find_by_name("David Oh")
    c.should be
    c.role.should == "Dev"
    c.email.should == "doh@thoughtworks.com"
    c.skill.should == "ruby"
    c.grade.should == "Consultant"
  end

end

