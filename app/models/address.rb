class Address < ApplicationRecord

  belongs_to :customer

  validates :postal_code, presence: true, length: { is: 7, message: "は7桁で入力してください" }
  validates :address, presence: { message: "を入力してください" }
  validates :name, presence: { message: "を入力してください" }

end
