class CardForm
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :municipality, :building_name, :phone_number, :token, :user_id, :item_id

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :prefecture_id
    validates :city
    validates :municipality
    validates :phone_number, numericality: { less_than_or_equal_to: 99_999_999_999 }
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :token
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, municipality: municipality, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
