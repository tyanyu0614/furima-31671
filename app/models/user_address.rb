class UserAddress
  include ActiveModel::Model
  attr_accessor :postal_code,:prefecture_id,:municipalities,:address_number,:building_name,:phone_number,:purchase,:user_id,:item_id
  attr_accessor :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code ,format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 0 } #ジャンルの選択が「--」の時は保存できないようにする
    validates :municipalities
    validates :address_number
    validates :phone_number ,format: {with: /\A0[5789]0[-]?\d{4}[-]?\d{4}\z/ }
    validates :token
    # validates :purchase
  end
  
  def save
    # 各テーブルにデータを保存する処理を書く
    
    # 購入履歴の情報を保存し、「purchase」という変数に入れている
    purchase = Purchase.create!(user_id: user_id, item_id: item_id)
    # 配送先の情報を保存
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, address_number: address_number, building_name: building_name, phone_number:phone_number, purchase_id: purchase.id)
    
  end
    
end
