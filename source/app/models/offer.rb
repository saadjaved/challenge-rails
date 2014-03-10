class Offer < ActiveRecord::Base
  belongs_to :merchant

  # Fetching Offers from the Offer Fetcher and creating Merchants and Offers from it.
  # Creating if the record is not present otherwise just getting it from the database.
  def self.fetch_offers
    offers = OfferFetcher.new("/link-search?website-id=5742006&records-per-page=20")
    offers.data.each do |offer|
      merchant = Merchant.where(id: offer['advertiser_id'], name: offer['advertiser_name']).first_or_create
      merchant.offers.where(id: offer['link_id'],
                            title: offer['category'],
                            description: offer['description'],
                            url: offer['destination'],
                            expires_at: offer['promotion-end-date']).first_or_create
    end
  end
end
