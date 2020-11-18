require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it "商品名が空では登録できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    
    it "商品の説明が空では登録できない" do
      @item.description = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
      
    end
    
    it "カテゴリーの情報が空では登録できないこと" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it "商品の状態が空では登録できないこと" do
      @item.condition_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it "配送料の負担についての情報が空では登録できないこと" do
        @item.delivery_fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
    end
    
    it "発送元の地域についての情報が空では登録できないこと" do
      @item.shipping_area_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area can't be blank")
    end

    it "発送までの日数についての情報が空では登録できないこと" do
      @item.day_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Day can't be blank")
    end

    it "価格の情報が空では登録できないこと" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "価格の範囲が、¥300~¥9,999,999の間でなければ登録できないこと" do
      @item.price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 299")
    end

    it "販売価格は半角数字以外は登録できないこと" do
      @item.price = "１１１１１１"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end



 end
end
