require 'spec_helper'

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :fakeweb
end

describe Offer do
  it "should create a new offer with valid attributes" do
    create(:offer).should be_valid
  end

  it "should make a request to fetch offers via api and save them" do
    VCR.use_cassette('offers') do
      Offer.fetch_offers
    end
    Offer.count.should eq(20)
  end

  # Preventing duplicates when fetching offers via API
  # Two checks:
  # ---- One will have the new offer added to the database
  # ---- After second request, previous offer should have the same count i.e. 1
  it "should not save duplicates when fetching offers via api" do
    VCR.use_cassette('offers') do
      Offer.fetch_offers
    end

    offer = Offer.last

    VCR.use_cassette('duplicate_offers') do
      Offer.fetch_offers
    end

    Offer.count.should eq(21)
    Offer.where(id: offer.id).count.should eq(1)
  end

end
