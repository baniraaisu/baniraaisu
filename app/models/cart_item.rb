class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  validates :customer_id, :item_id, :number, presence: true
	validates :number, numericality: { only_integer: true }
end
