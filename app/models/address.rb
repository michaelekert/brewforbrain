class Address < ApplicationRecord
  belongs_to :order
  validates :first_name, :last_name, :email, :city, :street, :zip_code, presence: true
end
