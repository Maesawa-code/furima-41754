require 'rails_helper'

RSpec.describe PurchaseRecordDeliveryAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_record_delivery_address = FactoryBot.build(
      :purchase_record_delivery_address,
      user_id: @user.id,
      item_id: @item.id
    )
    sleep 1
  end

  describe '購入情報の保存' do
    context '保存できる場合' do
      it '全ての項目が正しく入力されていれば保存できる' do
        expect(@purchase_record_delivery_address).to be_valid
      end

      it '建物名が空でも保存できる' do
        @purchase_record_delivery_address.building_name = ''
        expect(@purchase_record_delivery_address).to be_valid
      end
    end

    context '保存できない場合' do
      it 'item_idが空では保存できない' do
        @purchase_record_delivery_address.item_id = nil
        @purchase_record_delivery_address.valid?
        expect(@purchase_record_delivery_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'user_idが空では保存できない' do
        @purchase_record_delivery_address.user_id = nil
        @purchase_record_delivery_address.valid?
        expect(@purchase_record_delivery_address.errors.full_messages).to include("User can't be blank")
      end

      it 'postal_codeが空では保存できない' do
        @purchase_record_delivery_address.postal_code = ''
        @purchase_record_delivery_address.valid?
        expect(@purchase_record_delivery_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが「3桁ハイフン4桁」の形式でなければ保存できない' do
        @purchase_record_delivery_address.postal_code = '1234567'
        @purchase_record_delivery_address.valid?
        expect(@purchase_record_delivery_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end

      it 'prefecture_idが1では保存できない' do
        @purchase_record_delivery_address.prefecture_id = 1
        @purchase_record_delivery_address.valid?
        expect(@purchase_record_delivery_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空では保存できない' do
        @purchase_record_delivery_address.city = ''
        @purchase_record_delivery_address.valid?
        expect(@purchase_record_delivery_address.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空では保存できない' do
        @purchase_record_delivery_address.address = ''
        @purchase_record_delivery_address.valid?
        expect(@purchase_record_delivery_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空では保存できない' do
        @purchase_record_delivery_address.phone_number = ''
        @purchase_record_delivery_address.valid?
        expect(@purchase_record_delivery_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが10桁未満では保存できない' do
        @purchase_record_delivery_address.phone_number = '090123456'
        @purchase_record_delivery_address.valid?
        expect(@purchase_record_delivery_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが12桁以上では保存できない' do
        @purchase_record_delivery_address.phone_number = '090123456789'
        @purchase_record_delivery_address.valid?
        expect(@purchase_record_delivery_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberにハイフンが含まれていると保存できない' do
        @purchase_record_delivery_address.phone_number = '090-1234-5678'
        @purchase_record_delivery_address.valid?
        expect(@purchase_record_delivery_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'tokenが空では保存できない' do
        @purchase_record_delivery_address.token = nil
        @purchase_record_delivery_address.valid?
        expect(@purchase_record_delivery_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
