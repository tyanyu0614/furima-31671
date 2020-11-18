class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :items

         NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
         NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/

         with_options presence: true do
          validates :nickname
          validates :password,format: { with:/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]/ }
          validates :password_confirmation,format: { with:/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]/ }
          validates :first_name, format: {with: NAME_REGEX }
          validates :last_name, format: {with: NAME_REGEX }
          validates :kana_first, format: {with: NAME_KANA_REGEX }
          validates :kana_last, format: {with: NAME_KANA_REGEX}
          validates :birth_day
         end 
         
end
