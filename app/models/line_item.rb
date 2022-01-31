class LineItem < ApplicationRecord
  belongs_to :book
  belongs_to :order

  def full_price
    unit_price * quantity
  end
end
