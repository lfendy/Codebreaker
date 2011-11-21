require 'spec_helper'

describe Consultant do
  before :each do
    hash = {:name => "David", :skills_attributes => [{:name => "ruby"}]}
    hash2 = {:name => "Pei Shi", :skills_attributes => [{:name => "ruby"}]}
    Consultant.create(hash)
    Consultant.create(hash2)
  end
  it "should create only one skill for a given name" do
    Skill.count.should == 1
  end
  it "should associate skill with consultant" do
    Consultant.first.skills.count.should == 1
  end
end
