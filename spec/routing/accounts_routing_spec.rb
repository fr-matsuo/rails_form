require "rails_helper"

RSpec.describe AccountsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/accounts").to route_to("accounts#index")
    end

    it "routes to #new" do
      expect(:get => "/accounts/new").to route_to("accounts#new")
    end

    it "routes to #new" do
      expect(:post => "/accounts/new").to route_to("accounts#new")
    end

    it "routes to #check" do
      expect(:post => "/accounts/check").to route_to("accounts#check")
    end

    it "routes to #new" do
      expect(:post => "/accounts/finish").to route_to("accounts#finish")
    end
  end
end
