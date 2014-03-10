class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]

  # GET /offers
  # GET /offers.json
  def index
    @offers = Offer.all
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
  end

  # Crawl Method which will hit the provided service and fetch the offers.
  # This method will filter out the merchants and offers from the set of links fetched.
  # A merchant is created with its respective offer.
  def crawl
    Offer.fetch_offers
    redirect_to offers_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.require(:offer).permit(:merchant_id, :title, :description, :url, :expires_at)
    end
end
