class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :ship_fee
  belongs_to :region
  belongs_to :ship_time
  belongs_to :user
  has_one_attached :image

  validates :name,         presence: true
  validates :description,  presence: true
  validates :category_id,  presence: true
  validates :status_id,    presence: true
  validates :ship_fee,     presence: true
  validates :region_id,    presence: true
  validates :ship_time_id, presence: true
  validates :price,        presence: true
  validates :image,        presence: true

  validates :category_id, numericality: { other_than: 0 }
  validates :status_id, numericality: { other_than: 0 }
  validates :ship_fee_id, numericality: { other_than: 0 }
  validates :region_id, numericality: { other_than: 0 }
  validates :ship_time_id, numericality: { other_than: 0 }

  # 1以上、1000000以下の整数を許可する
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is invalid' }

  with_options presence: true do
    # 半角数字のみ許可する
    validates :price, format: { with: /\A[0-9]+\z/, message: '価格は半角数字で入力してください' }
  end
end
