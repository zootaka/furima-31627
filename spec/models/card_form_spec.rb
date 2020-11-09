require 'rails_helper'

RSpec.describe CardForm, type: :model do
  describe '販売情報の保存' do
    before do
      @card_form = FactoryBot.build(:card_form)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@card_form).to be_valid
    end
    it 'prefecture_idが空だと保存できないこと' do
      @card_form.prefecture_id = nil
      @card_form.valid?
      expect(@card_form.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空だと保存できないこと' do
      @card_form.city = nil
      @card_form.valid?
      expect(@card_form.errors.full_messages).to include("City can't be blank")
    end
    it 'municipalityが空だと保存できないこと' do
      @card_form.municipality = nil
      @card_form.valid?
      expect(@card_form.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'phone_numberが100000000000以上だとと保存できないこと' do
      @card_form.phone_number = 100_000_000_000
      @card_form.valid?
      expect(@card_form.errors.full_messages).to include('Phone number must be less than or equal to 99999999999')
    end
    it 'phone_numberが空だと保存できないこと' do
      @card_form.phone_number = nil
      @card_form.valid?
      expect(@card_form.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'post_codeに-がないと保存できないこと' do
      @card_form.post_code = 1_111_111
      @card_form.valid?
      expect(@card_form.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
    end
    it 'post_codeが空だと保存できないこと' do
      @card_form.post_code = nil
      @card_form.valid?
      expect(@card_form.errors.full_messages).to include("Post code can't be blank")
    end
    it 'tokenが空だと保存できないこと' do
      @card_form.token = nil
      @card_form.valid?
      expect(@card_form.errors.full_messages).to include("Token can't be blank")
    end
    it 'building_nameは空でも保存できること' do
      @card_form.building_name = nil
      expect(@card_form).to be_valid
    end
  end
end
