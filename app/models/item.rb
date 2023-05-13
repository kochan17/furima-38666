class Item < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :user
  has_one_attached :image
  
  validates :region_id, numericality: { other_than: 1}
  validates :deadline_id, numericality: { other_than: 1}
  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_text, presence: true
  validates :delivery_fee_payment_id, presence: true
  validates :region_id, presence: true
  validates :deadline_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
  validates :price, numericality: {only_integer: true, message: 'Half-width number'}
end
