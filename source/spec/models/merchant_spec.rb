require 'spec_helper'

describe Merchant do
  it "should create a new merchant with valid attributes" do
    create(:merchant).should be_valid
  end
end
