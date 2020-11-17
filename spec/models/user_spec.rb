require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    
      it 'nicknameが空では登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")  
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")  
      end
      it 'kana_firstが空では登録できない' do
        @user.kana_first = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first can't be blank")  
      end
      it 'kana_lastが空では登録できない' do
        @user.kana_last = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last can't be blank")  
      end
      it '生年月日が空では登録できない' do
        @user.birth_day = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")  
      end
      it '確認用パスワードが空だとユーザー登録できない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")  
        
      end
      it 'メールアドレスに@が含まれていないとと登録できない' do
        @user.email = "tttttttttt"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")     
      end
      it 'パスワードと確認用パスワードが一致しないと登録できない' do
        @user.password_confirmation = "111111e"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")     
        
      end
      it 'passwordが半角英字のみだとユーザー登録できない' do
        @user.password = "qqqqqqq"
        @user.password_confirmation = "qqqqqqq"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")     
        
      end
      it 'passwordが半角数字のみだとユーザー登録できない' do
        @user.password = "1111111"
        @user.password_confirmation = "1111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")     
        
      end
      it 'passwordが全角だとユーザー登録できない' do
        @user.password = "１１１１１１A"
        @user.password_confirmation = "１１１１１１A"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")     
        
      end
      it 'kana_firstが全角（カタカナ）以外だとユーザー登録できない' do
        @user.kana_first = "たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first is invalid")     
        
      end
      it 'kana_lastが全角（カタカナ）以外だとユーザー登録できない' do
        @user.kana_last = "たまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last is invalid")     
        
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）以外だとユーザー登録できない' do
        @user.first_name = "A"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")     
        
      end
      it 'last_nameが全角（漢字・ひらがな・カタカナ）以外だとユーザー登録できない' do
        @user.last_name = "A"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")     
        
      end
      it '重複したメールアドレスがある場合は登録ができない' do 
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
        end
    end
end
