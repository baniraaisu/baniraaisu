class Item < ApplicationRecord
 belongs_to :genre
 has_one_attached :image
 has_many :cart_items, dependent: :destroy

validates :name,presence: true
validates :introduction,presence: true
validates :tax_off_price, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999_999 },
                  format: { with: /\A[0-9]+\z/ }
validates :image,presence: true


  def get_image(width, height)
    image.variant(resize_to_limit: [width, height]).processed
  end

  def after_tax_on_price
     tax_off_price * 1.10
  end
end