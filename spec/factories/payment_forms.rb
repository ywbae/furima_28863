FactoryBot.define do
  factory :payment_form do
    token { 'testcard' }
    postal_code { '111-1234' }
    prefecture_id { 12 }
    city { '練馬区' }
    addresses { '青山1-1-3' }
    phone_number { '07011111234' }
  end
end
