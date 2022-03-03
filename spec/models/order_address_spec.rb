require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'zipが空だと保存できないこと' do
        @order_address.zip = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip can't be blank")
      end
      it 'zipが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.zip = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip を入力してください")
      end
      it 'region_idを選択していないと保存できないこと' do
        @order_address.region_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Region can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空だと保存できないこと' do
        @order_address.block = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'phoneが空だと保存できないこと' do
        @order_address.phone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが全角数字だと保存できないこと' do
        @order_address.phone = '１１１１１１１１１１１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
      end
      it 'phoneが10桁以下だと保存できないこと' do
        @order_address.phone = '111111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
      end
      it 'phoneが11桁以上だと保存できないこと' do
        @order_address.phone = '111111111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空だと保存できないこと' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
