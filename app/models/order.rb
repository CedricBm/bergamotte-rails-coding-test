class Order < ActiveRecord::Base
  belongs_to :customer

  has_one :product

  enum status: [:daft, :confirmed, :canceled]
end
