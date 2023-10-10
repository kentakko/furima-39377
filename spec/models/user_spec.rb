require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

 describe 'ユーザー新規登録' do
  context '登録ができる時' do
    it '全ての項目の入力が存在すれば登録できること' do
      expect(@user).to be_valid
    end
    it 'passwordが6文字以上かつ半角英数字混合であれば登録できること' do
      @user.password = '12345a'
      @user.password_confirmation = '12345a'
      expect(@user).to be_valid
    end
    it "family_nameが全角文字であれば登録できる" do
      @user.family_name = "山田"
      expect(@user).to be_valid
    end
    it "first_nameが全角文字であれば登録できる" do
      @user.first_name = "太郎"
      expect(@user).to be_valid
    end
    it "family_name_kanaが全角カナであれば登録できる" do
      @user.family_name_kana = "ヤマダ"
      expect(@user).to be_valid
    end
    it "first_name_kanaが全角カナであれば登録できる" do
      @user.first_name_kana = "タロウ"
      expect(@user).to be_valid
    end
  end

  context '登録ができない時' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ' '
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
      # binding.pry
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      #puts another_user.errors.full_messages # エラーメッセージを出力
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
    it 'パスワードは半角英数字混合であること' do
      @user.password = 'password123' # 半角英数字混合の例
      @user.valid?
      expect(@user.errors.full_messages).to_not include('Password should contain both letters and numbers')
    end
    it 'passwordが全角のときに登録できないこと' do
      @user.password = '１２３４５A'
      @user.password_confirmation = '１２３４５A'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it '生年月日が空では登録できない' do
      @user.birth_day = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end    
   end 
 end
end