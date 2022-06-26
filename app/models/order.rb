class Order < ApplicationRecord
  belongs_to :items
  enum pay_method: { credit_card: 0, transfer: 1 }
  enum status: {入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4}
  
  def shipping
    '〒'+post_code+''+adress+''+first_name+''+last_name
  end
end
