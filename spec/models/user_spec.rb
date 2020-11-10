require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '全ての記載ができれば登録する' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'メールアドレスは@を含んでいないと保存できない' do
      @user.email = "kkkgmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'passwordが空では登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'password:半角英数混合(半角英語のみ)' do
      @user.password = '1234oh'
      @user.password_confirmation = '1234oh'
      expect(@user).to be_valid
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordは半角英数混合(半角英語のみ)しか保存できない' do
      @user.password = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "passwordとpassword_confirmationが不一致では登録できないこと" do
      @user.password = "123456"
      @user.password_confirmation = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'first_nameが空では登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'second_nameが空では登録できないこと' do
      @user.second_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Second name can't be blank")
    end

    it 'first_name_kが空では登録できないこと' do
      @user.first_name_k = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name k can't be blank")
    end

    it 'second_name_kが空では登録できないこと' do
      @user.second_name_k = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Second name k can't be blank")
    end

    it 'Birthdayが空では登録できないこと' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）で入力していない場合は保存できない' do
      @user.first_name = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角(漢字）文字を使用してください")
    end

    it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）で入力していない場合は保存できない' do
      @user.first_name_k = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name k 全角カタカナ文字を使用してください")
    end
  end
end
