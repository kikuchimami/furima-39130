require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
end

describe 'ユーザー新規登録' do
  context '正常系' do
    it 'nicknameとemail、passwordとpassword_confirmation、名字と名前、名字(カナ)と名前(カナ)、生年月日が存在すれば登録できる' do
    end
  end

  context '異常系' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it '英字のみのパスワードでは登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it '数字のみのパスワードでは登録できない' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it '名字(全角)がないと登録できない' do
      @user.family_name_zenkaku = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name zenkaku can't be blank")
    end
    it '名前(全角)がないと登録できない' do
      @user.last_name_zenkaku = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name zenkaku can't be blank")
    end
    it '名字(全角)が、全角でないと登録できない' do
      @user.family_name_zenkaku = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name zenkaku 全角文字を使用してください")
    end
    it '名前(全角)が、全角でないと登録できない' do
      @user.last_name_zenkaku = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name zenkaku 全角文字を使用してください")
    end
    it '名字カナ(全角)がないと登録できない' do
      @user.kana_family_name_zenkaku = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana family name zenkaku can't be blank")
    end
    it '名前カナ(全角)がないと登録できない' do
      @user.kana_last_name_zenkaku = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last name zenkaku can't be blank")
    end
    it '名字カナ(全角)が、全角でないと登録できない' do
      @user.kana_family_name_zenkaku = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana family name zenkaku 全角文字を使用してください")
    end
    it '名前カナ(全角)が、全角でないと登録できない' do
      @user.kana_last_name_zenkaku = 'ﾃｽﾄ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last name zenkaku 全角文字を使用してください")
    end
    it '名字カナ(全角)にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
    @user.kana_last_name_zenkaku = 'やまだ' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last name zenkaku 全角文字を使用してください")
    end
    it '名前カナ(全角)にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
    @user.kana_last_name_zenkaku = 'たろう' 
    @user.valid?
    expect(@user.errors.full_messages).to include("Kana last name zenkaku 全角文字を使用してください")
    end
    it '生年月日の入力がないと、登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
end