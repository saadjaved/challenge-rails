require 'spec_helper'

feature "Fetching Offers" do
 scenario "Hitting the crawl button fetches offers and shows them on re-load" do
   VCR.use_cassette('offers') do
    visit '/offers'
    click_link 'Crawl!'
    expect(page).to have_content '20 Offers'

    visit '/offers'
    expect(page).to have_content 'BornPrettyStore Liner Polish with Glitter from 0.99 USD'
   end
 end

end