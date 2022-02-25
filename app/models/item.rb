class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :ship_fee
  belongs_to :region
  belongs_to :ship_time
  has_one_attached :image

  validates :name,         presence: true
  validates :description,  presence: true
  validates :category_id,  presence: true
  validates :status_id,    presence: true
  validates :ship_fee_id,  presence: true
  validates :region_id,    presence: true
  validates :ship_time_id, presence: true
  validates :price,        presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  #validates :category_id, numericality: { other_than: 1 , , message: "can't be blank"}
  #validates :status_id, numericality: { other_than: 1 , , message: "can't be blank"}
  #validates :ship_fee_id, numericality: { other_than: 1 , , message: "can't be blank"}
  #validates :region_id, numericality: { other_than: 1 , , message: "can't be blank"}
  #validates :ship_time_id, numericality: { other_than: 1 , , message: "can't be blank"}
end
