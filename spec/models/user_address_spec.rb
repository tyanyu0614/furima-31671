require 'rails_helper'

RSpec.describe UserAddress, type: :model do
 describe '#create' do
    before do
      @user_address = FactoryBot.build(:user_address)
    end

    it "すべての値が揃っているとき、データベースへ保存できる" do
      expect(@user_address).to be_valid
    end

    it "tokenが空では登録できないこと" do
      @user_address.token = nil
      @user_address.valid?
      expect(@user_address.errors.full_messages).to include("Token can't be blank")
    end

    it "郵便番号がない場合は登録できない" do
      @user_address.postal_code = ""
      @user_address.valid?
      expect(@user_address.errors.full_messages).to include("Postal code can't be blank")
    end
    
    it "郵便番号はハイフンがない場合は登録できない" do
      @user_address.postal_code = 8100000
      @user_address.valid?
      expect(@user_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it "都道府県がない場合は登録できない" do
      @user_address.prefecture_id = ""
      @user_address.valid?
      expect(@user_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it "都道府県が(--)場合は登録できない" do
      @user_address.prefecture_id = 0
      @user_address.valid?
      expect(@user_address.errors.full_messages).to include("Prefecture must be other than 0")
    end

    it "市区町村がない場合は登録できない" do
      @user_address.municipalities = ""
      @user_address.valid?
      expect(@user_address.errors.full_messages).to include("Municipalities can't be blank")
    end

    it "番地がない場合は登録できない" do
      @user_address.address_number = ""
      @user_address.valid?
      expect(@user_address.errors.full_messages).to include("Address number can't be blank")
    end
    
    it "建物が空でも保存できる" do
      @user_address.building_name = ""
      expect(@user_address).to be_valid
    end

    it "電話番号がない場合は登録できない" do
      @user_address.phone_number = ""
      @user_address.valid?
      expect(@user_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it "電話番号は11桁を超える場合は登録できない" do
      @user_address.phone_number = 111111111111
      @user_address.valid?
      expect(@user_address.errors.full_messages).to include("Phone number is invalid")
    end
  end
end