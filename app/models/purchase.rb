class Purchase < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  has_one :address
  belongs_to :item
  belongs_to :user
  
end
