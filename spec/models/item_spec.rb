require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

describe '商品登録' do
    context '商品が出品できる場合' do
      it '全ての項目が存在していれば保存できる' do
        expect(@item).to be_valid
      end
     end
    context '商品が出品できない場合' do
      it 'nameが空では保存できない' do
        @item.neme = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空では保存できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空では保存できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_idが空では保存できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'ship_fee_idが空では保存できない' do
        @item.ship_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship_Fee can't be blank")
      end
      it 'region_idが空では保存できない' do
        @item.region_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end
      it 'ship_time_idが空では保存できない' do
        @item.ship_time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship_Time can't be blank")
      end
      it 'priceが空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数字では保存できない' do
        @message.price = '１０００'
        @message.valid?
        expect(@message.errors.full_messages).to include('Price is invalid')
      end
      it 'priceが300以下では保存できない' do
        @message.price = '299'
        @message.valid?
        expect(@message.errors.full_messages).to include('Price is invalid')
      end
      it 'priceが9999999以上では保存できない' do
        @message.price = '10000000'
        @message.valid?
        expect(@message.errors.full_messages).to include('Price is invalid')
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end