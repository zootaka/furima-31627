class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :postage_payer_id
    validates :prefecture_id
    validates :handing_time_id
    validates :price
  end

  has_many :comments
  has_one :purchase
  belongs_to :user
  has_one_attached :image
end
