class CardForm
  include ActiveModel::Model
  attr_accessor :purchase, :address, :token

  # ここにバリデーションの処理を書く
  validates :purchase, presence: true
  validates :address, presence: true
  def save
    # 各テーブルにデータを保存する処理を書く
    Address.create
    Purchase.create
  end
end