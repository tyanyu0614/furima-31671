require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

    describe 'ユーザー新規登録' do
      it 'nicknameが空では登録できない' do
        user = User.new(nickname:"",email: "test@example", password: "1qqqqqq", password_confirmation: "1qqqqqq", first_name:"花",last_name:"山田",kana_first:"ハナ",kana_last:"ヤマダ",birth_day:"1930-02-03")
        user.valid?
        expect(user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        user = User.new(nickname:"テスト",email: "", password: "1qqqqqq", password_confirmation: "1qqqqqq", first_name:"花",last_name:"山田",kana_first:"ハナ",kana_last:"ヤマダ",birth_day:"1930-02-03")
        user.valid?
        expect(user.errors.full_messages).to include("Email can't be blank")
      end
      it 'first_nameとlast_nameが空では登録できない' do
        user = User.new(nickname:"テスト",email: "test@example", password: "1qqqqqq", password_confirmation: "1qqqqqq", first_name:"",last_name:"",kana_first:"ハナ",kana_last:"ヤマダ",birth_day:"1930-02-03")
        user.valid?
        expect(user.errors.full_messages).to include("First name can't be blank", "First name is invalid", "Last name can't be blank", "Last name is invalid")
      end
      it 'kana_firstが空では登録できない' do
        user = User.new(nickname:"テスト",email: "test@example", password: "1qqqqqq", password_confirmation: "1qqqqqq", first_name:"花",last_name:"山田",kana_first:"",kana_last:"ヤマダ",birth_day:"1930-02-03")
        user.valid?
        expect(user.errors.full_messages).to include("Kana first can't be blank")
      end
      it 'kana_lastが空では登録できない' do
        user = User.new(nickname:"テスト",email: "test@example", password: "1qqqqqq", password_confirmation: "1qqqqqq", first_name:"花",last_name:"山田",kana_first:"ハナ",kana_last:"",birth_day:"1930-02-03")
        user.valid?
        expect(user.errors.full_messages).to include("Kana last can't be blank")
      end
      it 'パスワードは、半角英数字混合での入力が必須であること' do
        user = User.new(nickname:"テスト",email: "test@example", password: "pppppp", password_confirmation: "pppppp", first_name:"花",last_name:"山田",kana_first:"ハナ",kana_last:"ヤマダ",birth_day:"1930-02-03")
        user.valid?
        expect(user.errors.full_messages).to include("Password is invalid")
      end
      it '重複したメールアドレスがある場合は登録ができない' do
        
        User.create(nickname:"テスト",email: "test@example", password: "1qqqqqq", password_confirmation: "1qqqqqq", first_name:"花",last_name:"山田",kana_first:"ハナ",kana_last:"ヤマダ",birth_day:"1930-02-09")
        another_user = User.new(nickname:"テスト",email: "test@example", password: "1qqqqqq", password_confirmation: "1qqqqqq", first_name:"花",last_name:"山田",kana_first:"ハナ",kana_last:"ヤマダ",birth_day:"1930-02-09")
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
    end
end
