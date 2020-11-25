require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it "画像がない場合は登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("画像を入力してください")
    end
    
    it "商品名が空では登録できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end

    it "商品の説明が空では登録できない" do
      @item.description = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      
    end
    
    it "カテゴリーの情報が空では登録できないこと" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
    end

    it "商品の状態が空では登録できないこと" do
      @item.condition_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の状態を入力してください")
    end

    it "配送料の負担についての情報が空では登録できないこと" do
        @item.delivery_fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
    end
    
    it "発送元の地域についての情報が空では登録できないこと" do
      @item.shipping_area_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("配送元の地域を入力してください")
    end

    it "発送までの日数についての情報が空では登録できないこと" do
      @item.day_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
    end

    it "価格の情報が空では登録できないこと" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は数値で入力してください")
    end

    it "価格の下限が、299円以下の場合は登録できないこと" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は299より大きい値にしてください")
    end
    
    it "価格の上限が、10000000円以上の場合は登録できないこと" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は9999999より小さい値にしてください")
    end

    it "販売価格は半角数字以外は登録できないこと" do
      @item.price = "１１１１１１"
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は数値で入力してください")
    end

    it "カテゴリーが、--（0）のときは登録できないこと" do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーは0以外の値にしてください")
    end
    it "商品の状態が、--（0）のときは登録できないこと" do
      @item.condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の状態は0以外の値にしてください")
    end
    it "配送料の負担が、--（0）のときは登録できないこと" do
      @item.delivery_fee_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料の負担は0以外の値にしてください")
    end
    it "発送元の地域が、--（0）のときは登録できないこと" do
      @item.shipping_area_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("配送元の地域は0以外の値にしてください")
    end
    
    it "発送までの日数が、--（0）のときは登録できないこと" do
      @item.day_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("発送までの日数は0以外の値にしてください")
    end
    



 end
end
