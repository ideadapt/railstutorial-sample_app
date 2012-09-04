require 'spec_helper'

describe "UserPages" do
  describe "GET /signup" do
    it "signup is accessable" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get signup_path
      response.status.should be(200)
    end
  end
end
