require "spec_helper"

describe OffersController do
  describe "routing" do

    it "routes to #index" do
      get("/offers").should route_to("offers#index")
    end

    it "routes to #show" do
      get("/offers/1").should route_to("offers#show", :id => "1")
    end

  end
end
