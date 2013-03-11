require 'spec_helper'

describe Gitlab::Client do
  describe ".groups" do
    before do
      stub_get("/groups", "groups")
      stub_get("/groups/3", "group")
      @group = Gitlab.group(3)
      @groups = Gitlab.groups
    end

    it "should get the correct resource" do
      a_get("/groups").should have_been_made
      a_get("/groups/3").should have_been_made
    end

    it "should return an array of Groups" do
      @groups.should be_an Array
      @groups.first.path.should == "threegroup"
    end
  end

  describe ".create_group" do
    before do
      stub_post("/groups", "group_create")
      @group = Gitlab.create_group('GitLab-Group', 'gitlab-path')
    end

    it "should get the correct resource" do
      a_post("/groups").
          with(:body => {:path => 'gitlab-path', :name => 'GitLab-Group'}).should have_been_made
    end

    it "should return information about a created group" do
      @group.name.should == "Gitlab-Group"
      @group.path.should == "gitlab-group"
    end
  end
end
