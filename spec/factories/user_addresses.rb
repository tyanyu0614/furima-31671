FactoryBot.define do
  factory :user_address do

    token {"tok_abcdefghijk00000000000000000"}

    postal_code {"111-1111"}
    prefecture_id {1}
    
    municipalities {"横浜市"}
    address_number {111}
    building_name {"建物名"}
    phone_number {"09011111111"}
    
  end
end
