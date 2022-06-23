class Order < ApplicationRecord

enum status: {
    credit_card: 0,
    transfer: 1,
}

end
