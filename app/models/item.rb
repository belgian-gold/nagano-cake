class Item < ApplicationRecord
  # has_one_attached :image

  has_many :cart_items, dependent: :destroy
  # 商品:1、cart_items:多

  has_many :order_details, dependent: :destroy
  # 商品:1、order_details(注文履歴の商品):多
  belongs_to :genre
  # 商品:多、ジャンル1


  has_one_attached :item_image
  # 画像投稿の画像

  ## 消費税を求めるメソッド
  def with_tax_price
      (price * 1.1).floor
  end

# enum is_production_status: { cannot_start: 0, waiting: 1, production: 2, completed: 3 }

 validates :item_image, presence: true
 validates :name, presence: true
 validates :name_explanation, presence: true
 validates :genre_id, presence: true
 validates :price, presence: true
# def get_item_image(width, height)
#     unless image.attached?
#       file_path = Rails.root.join('app/assets/images/no_image.jpg')
#       image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
#     end
#     image.variant(resize_to_limit: [width, height]).processed
#   end

  def get_item_image
    (item_image.attached?) ? item_image: 'no_image.jpg'
  end
end