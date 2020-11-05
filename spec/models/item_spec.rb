require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品登録がうまくいく時' do
      it '全てのカラムが存在すれば登録できること' do
        expect(@item).to be_valid
      end
    end

    context '商品登録がうまくいかない時' do
      it '商品画像を1枚つけないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空では登録できないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'descriptionが空では登録できないこと' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'category_idが空では登録できないこと' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'condition_idが空では登録できないこと' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'postage_payer_idが空では登録できないこと' do
        @item.postage_payer_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage payer can't be blank")
      end

      it 'prefecture_idが空では登録できないこと' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'handling_time_idが空では登録できないこと' do
        @item.handling_time_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Handling time can't be blank")
      end

      it 'priceが空では登録できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が、¥300未満は登録できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 300')
      end

      it '販売価格が¥10,000,000以上は登録できない事' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end

      it '販売価格は半角数字以外は保存できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'category_idが1では登録できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it 'condition_idが1では登録できないこと' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end

      it 'handling_time_idが1では登録できないこと' do
        @item.handling_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Handling time must be other than 1')
      end

      it 'postage_payer_idが1では登録できないこと' do
        @item.postage_payer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage payer must be other than 1')
      end

      it 'prefecture_idが1では登録できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
    end
  end
end
