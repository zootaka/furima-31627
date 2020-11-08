class Address < ApplicationRecord
  validates :post_code,          null: false
  validates :prefecture_id,      null: false
  validates :city,               null: false
  validates :municipality,       null: false
  validates :building_name,      null: false
  validates :phone_number,       null: false
  validates :purchase,           foreign_key: true

  belongs_to :purchase
end