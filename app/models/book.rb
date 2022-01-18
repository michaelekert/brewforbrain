class Book < ApplicationRecord
  require 'csv'
  def self.import(file)
    CSV.foreach(file, headers: true) do |row|
      p hash_row = row.to_h
      value_to_increment = hash_row['quantity'].to_i
      parameter = hash_row['name']
      parameter1 = hash_row['price']
      book = Book.find_or_create_by(name: parameter, price: parameter1)
      book.increment!('quantity',value_to_increment)
    end
    end
  end
