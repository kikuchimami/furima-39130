class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :shipping_date
  has_one_attached :image

  
  validates :product_name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :condition_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_charge_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_area_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_date_id, presence: true, numericality: { other_than: 1 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :item_image, presence: true
  
  has_one_attached :item_image
  #has_one :purchase
end
