require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録できる場合" do
      it "encrypted_passwordが6文字以上の半角英数字混合であれば登録できる" do
        @user.encrypted_password = "123456abcdefg"
        @user.password_confirmation = "123456abcdefg"
        expect(@user).to be_valid
      end
    end
    context "新規登録できない場合" do
      it "nicknameが空では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailが重複してると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email is not included in the list")
      end
      it "encrypted_passwordが空では登録できない" do
        @user.encrypted_password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Encrypted password can't be blank")
      end
      it "encrypted_passwordが5文字以下では登録できない" do
        @user.encrypted_password = "123ab"
        @user.password_confirmation = "123ab"
        @user.valid?
        expect(@user.errors.full_messages).to include("Encrypted password is too short (minimum is 6 characters)")
      end
      it "encrypted_passwordが英語のみでは登録できない" do
        @user.encrypted_password = "abcdefg"
        @user.password_confirmation = "abcdefg"
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end
      it "encrypted_passwordが数字のみでは登録できない" do
        @user.encrypted_password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end
      it "password_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      end
      it "password_confirmationはencrypted_passwordと一致した内容でなければ登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation is invalid")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.last_name = "YAMADA"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "nameが空では登録できない" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it "nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.name = "TAROU"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name is invalid")
      end
      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "last_name_kanaは全角（カタカナ）でなければ登録できない" do
        @user.last_name_kana = "山田"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it "name_kanaが空では登録できない" do
        @user.name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana can't be blank")
      end
      it "name_kanaは全角（カタカナ）でなければ登録できない" do
        @user.name_kana = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana is invalid")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
