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
    #it 'パスワードは半角英数字混合であること' do
      #@user.password = 'password123' # 半角英数字混合の例
      #@user.valid?
      #expect(@user.errors.full_messages).to_not include('Password should contain both letters and numbers')
    #end
    it '英字のみのパスワードでは登録できない' do
      @user.password = 'password' # 英字のみのパスワード
      @user.password_confirmation = 'password'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it '数字のみのパスワードでは登録できない' do
      @user.password = '123456' # 数字のみのパスワード
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
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
    it '姓（全角）が空だと登録できない' do
      @user.family_name = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it '姓（全角）に半角文字が含まれていると登録できない' do
      @user.family_name = 'Yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end
    it '名（全角）が空だと登録できない' do
      @user.first_name = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it '名（全角）に半角文字が含まれていると登録できない' do
      @user.first_name = 'Taro'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it '姓（カナ）が空だと登録できない' do
      @user.family_name_kana = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it '姓（カナ）にカタカナ以外の文字が含まれていると登録できない' do
      @user.family_name_kana = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end
    it '名（カナ）が空だと登録できない' do
      @user.first_name_kana = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it '名（カナ）にカタカナ以外の文字が含まれていると登録できない' do
      @user.first_name_kana = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end    
   end 
 end
end