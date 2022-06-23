class ShippingAdress < ApplicationRecord
    validates :adress_name,presence: true
    validates :adress,presence: true
    validates :post_code,length: {is: 7},presence: true
end
