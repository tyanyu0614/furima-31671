require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it "画像がない場合は登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
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

    it "価格の下限が、299円以下の場合は登録できないこと" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 299")
    end
    
    it "価格の上限が、10000000円以上の場合は登録できないこと" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 9999999")
    end

    it "販売価格は半角数字以外は登録できないこと" do
      @item.price = "１１１１１１"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it "カテゴリーが、--（0）のときは登録できないこと" do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 0")
    end
    it "商品の状態が、--（0）のときは登録できないこと" do
      @item.condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 0")
    end
    it "配送料の負担が、--（0）のときは登録できないこと" do
      @item.delivery_fee_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee must be other than 0")
    end
    it "発送元の地域が、--（0）のときは登録できないこと" do
      @item.shipping_area_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area must be other than 0")
    end
    
    it "発送までの日数が、--（0）のときは登録できないこと" do
      @item.day_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Day must be other than 0")
    end
    



 end
end
