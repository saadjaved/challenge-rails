require 'spec_helper'

describe "offers/index" do

  it "renders a list of offers" do
    offer = stub_model(Offer,
               :merchant_id => 1,
               :title => "Title",
               :description => "MyText",
               :url => "Url"
    )
    render :partial => "offers/offer.html.erb", :locals => {offer: offer}
  end
end
