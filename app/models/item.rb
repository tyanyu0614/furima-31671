class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :shipping_area
  belongs_to :day

  belongs_to :user
  has_one_attached :image

  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :delivery_fee_id, numericality: { other_than: 0 } 
  validates :shipping_area_id, numericality: { other_than: 0 } 
  validates :day_id, numericality: { other_than: 0 } 



  with_options presence: true do
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
