class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :shipping_adresses, dependent: :destroy

  validates :first_name, :last_name, :adress, :email, presence: true
  validates :tel_number, format: { with: /\A\d{10,11}\z/ }
  validates :first_name_kana, :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :post_code, format: { with: /\A\d{7}\z/ }

  def active_for_authentication?
    super && (self.is_deleted == false)
  end
end
