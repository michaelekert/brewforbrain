class Order < ApplicationRecord
  belongs_to :shipping_type
  has_many :line_items, :inverse_of => :order
  has_one :address

  def full_cost
    line_items.map { |e| e.full_price}.sum + shipping_cost
  end

end
