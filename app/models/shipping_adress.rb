class ShippingAdress < ApplicationRecord

  belongs_to :customer

# 住所を繋げるメソッド
  def full_address
    '〒' + post_code + ' ' + address + ' ' + adress_name
  end

end
