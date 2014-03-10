class OfferFetcher
  include HTTParty
  base_uri ENV['PUSHER_APP_URL']

  attr_accessor :data

  def initialize(path, options={})
    fetch_offers(path, options)
  end

# Using HTTParty to make the call to the base uri and fetching the response.
private
  def fetch_offers(path, options)
    options = { :headers => { "authorization" => ENV['PUSHER_APP_KEY']} }
    response = self.class.get(path, options)

    if response.success?
      @data = response['cj_api']['links']['link']
    else
      raise RailsChallengeErrors::BackendError, "#{response.code}: Failure fetching offers"
    end
  end
end