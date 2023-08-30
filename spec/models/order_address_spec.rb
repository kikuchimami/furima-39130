require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe '情報の保存' do
    
    context '内容に問題ない場合' do
      it "すべての値が正しく入力されていれば保存できること" do
        expect(@order_address).to be_valid
      end

      it "建物名が空でも保存可能" do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
    end
  end



    context '内容に問題がある場合' do
      it "postcodeが空だと保存できないこと" do
        @order_address.postcode = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode can't be blank")

      end

      it "cityは空不可" do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")

      end
      it "street_addressは空不可" do
        @order_address.street_address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street address can't be blank")

      end

      it "postcodeは空不可" do
        @order_address.postcode = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode can't be blank")
        end
      it "postcodeはハイフン必須" do
        @order_address.postcode = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode ○:123-4567 ×:1234567")

      end

      it "postcodeは数字7桁必須" do
        @order_address.postcode = "123-456"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode ○:123-4567 ×:1234567")

      end

      it "phone_numberは空不可" do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")

      end

      it "数字でない文字が含まれる場合は無効であること" do
        @order_address.phone_number = "abc1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number 半角数字で入れてください。○:09012345678  ×:090-1234-5678")
      end

      it "12桁の電話番号なら無効であること" do
        @order_address.phone_number = "090123456789"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number 半角数字で入れてください。○:09012345678  ×:090-1234-5678")
      end

      it "9桁の電話番号なら無効であること" do
        @order_address.phone_number = "012345678"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number 半角数字で入れてください。○:09012345678  ×:090-1234-5678")
      end

      it "shipping_areaを選択していないと保存できないこと" do
          @order_address.shipping_area_id = 1
          @order_address.valid? 
          expect(@order_address.errors.full_messages).to include("Shipping area can not be blank")
        end
   
      it "userが紐付いていないと保存できないこと" do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it "itemが紐付いていないと保存できないこと" do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end

      it "トークンがなければ無効であること" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
