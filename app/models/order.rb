class Order < ApplicationRecord
  belongs_to :shipping_type, optional: true
  has_many :line_items
  has_one :address

  accepts_nested_attributes_for :address, allow_destroy: true

  def full_cost
    line_items.map { |e| e.full_price}.sum + shipping_cost
  end

end
