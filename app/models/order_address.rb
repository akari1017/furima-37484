class OrderAddress
  include ActiveModel::Model
  attr_accessor :zip, :region_id, :city, :block, :building, :phone, :user_id, :item_id, :token

  validates :zip,       presence: true
  validates :region_id, presence: true
  validates :city,      presence: true
  validates :block,     presence: true
  validates :phone,     presence: true
  validates :user_id,   presence: true
  validates :item_id,   presence: true
  validates :token,     presence: true
  
  # 郵便番号は3桁ハイフン4桁での保存を許可する
  validates :zip, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を入力してください' }
  # 電話番号は10桁以上11桁以内の半角数値のみ保存を許可する
  validates :phone, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
  validates :phone, format: { with: /\A[0-9]+\z/, message: 'を入力してください' }

  validates :region_id, numericality: { other_than: 0 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(zip: zip, region_id: region_id, city: city, block: block, building: building, phone: phone, order_id: order.id)
  end
end