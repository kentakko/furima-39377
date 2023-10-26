require 'rails_helper'
RSpec.describe OrderForm, type: :model do  
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe 'ユーザー新規登録' do
    context '登録ができる時' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@order_form).to be_valid
      end
      it '建物名が空でも購入できること' do
        @order_form.building_name = ''
        expect(@order_form).to be_valid
      end
      it "priceとtokenがあれば保存ができること" do
        expect(@order_form).to be_valid
      end
    end

    context '登録ができない時' do
      it '郵便番号が空では保存できない' do
        @order_form.post_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号は『３桁ハイフン４桁』半角英数字でないと保存できない' do
        @order_form.post_code = '123-123４'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '都道府県に「---」が選択されている場合は保存できない' do
        @order_form.prefecture_id = '1'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと購入できないこと' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できない' do
        @order_form.address = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できない' do
        @order_form.phone_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が9桁以下だと保存できない' do
        @order_form.phone_number = '090123456'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid. Include hyphen(-)")
      end
      it '電話番号が12桁以上だと保存できない' do
        @order_form.phone_number = '090123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid. Include hyphen(-)")
      end
      it '電話番号が半角数値でないと保存できない' do
        @order_form.phone_number = '０9012341234'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid. Include hyphen(-)")
      end
      it "tokenが空では登録できないこと" do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end

