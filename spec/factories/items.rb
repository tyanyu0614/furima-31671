FactoryBot.define do
  factory :item do
    name {"商品の名前"}
    description {"商品の状態"}
    
    category_id {"2"}
    condition_id {"2"}
    delivery_fee_id {"2"}
    shipping_area_id {"2"}
    day_id{"2"}
    price {"300"}
  end
end
    