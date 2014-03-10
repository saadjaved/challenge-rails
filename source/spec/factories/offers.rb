# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :offer do
    merchant_id 1
    title "Test Title"
    description "Test Description"
    url "http://foo.bar"
    expires_at "2014-03-08 18:36:03"
  end
end
