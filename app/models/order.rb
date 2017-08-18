class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :product

  enum status: [:daft, :confirmed, :canceled]
end
