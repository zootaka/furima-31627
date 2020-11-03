require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録がうまくいくとき' do

      it "first_name,last_name,first_name_kana,last_name_kana,nickname,birth_date,email,password,password_confirmationが存在すれば登録できること" do
        expect(@user).to be_valid
      end

      it "passwordが6文字以上であれば登録できる" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do

      it "first_nameが空では登録できないこと" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to  include("First name can't be blank")
      end

      it "last_nameが空では登録できないこと" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to  include("Last name can't be blank")
      end

      it "first_name_kanaが空では登録できないこと" do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to  include("First name kana can't be blank")
      end

      it "last_name_kanaが空では登録できないこと" do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to  include("Last name kana can't be blank")
      end

      it "nicknameが空では登録できないこと" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to  include("Nickname can't be blank")
      end

      it "birth_dateが空では登録できないこと" do
        @user.birth_date = nil
        @user.valid?
        expect(@user.errors.full_messages).to  include("Birth date can't be blank")
      end

      it "emailが空では登録できないこと" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to  include("Email can't be blank")
      end

      it "メールアドレスは、@を含む必要があること" do
        @user.email = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "passwordが空では登録できないこと" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to  include("Password can't be blank")
      end

      it "password_confirmationがpasswordと同じでないと登録できないこと" do
        @user.password = "aaa111"
        @user.password_confirmation = "aaaa11"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end 
end