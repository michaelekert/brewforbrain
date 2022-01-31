class LineItem < ApplicationRecord
  belongs_to :book
  belongs_to :order, :inverse_of => :line_items

  def full_price
    unit_price * quantity
  end
end
