class Item < ApplicationRecord
  has_one_attached :image, presence: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Price must be between ¥300 and ¥9,999,999' }
  validates :price, format: { with: /\A[0-9]+\z/, message: 'Price is not a number' }
  validates :category_id, numericality: { other_than: 1, message: "Category can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "Sales status can't be blank" }
  validates :shipping_fee_id, numericality: { other_than: 1, message: "Shipping fee status can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "Prefecture can't be blank" }
  validates :shipping_day_id, numericality: { other_than: 1, message: "Scheduled delivery can't be blank" }
end
