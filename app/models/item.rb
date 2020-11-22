class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :shipping_area
  belongs_to :day

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options numericality: { other_than: 0 } do
  validates :category_id   
  validates :condition_id   
  validates :delivery_fee_id  
  validates :shipping_area_id  
  validates :day_id  
  end




  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :shipping_area_id
    validates :day_id
    validates :price, format: {with: /\A[0-9]+\z/},numericality:{ only_integer: true,
      greater_than: 299, less_than: 9999999 }

  end
end
