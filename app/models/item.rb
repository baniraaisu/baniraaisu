class Item < ApplicationRecord

  has_many :cart_items
  has_many :order_details

  belongs_to :genre
  has_one_attached :image

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def after_tax_on_price
     tax_off_price * 1.10
  end
end