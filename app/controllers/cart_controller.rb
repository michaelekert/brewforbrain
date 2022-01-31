class CartController < ApplicationController
  before_action

  def show
    @cart = current_cart
  end

  def edit
  end

  def confirmation
  end

  def add_item
    order = current_cart_or_create
    book = Book.find(params[:book_id])

      order.line_items.create book_id: book.id,
                              quantity: 1,
                              unit_price: book.price,
                              item_name: book.name
    redirect_to root_path, notice: "Dodano produkt do koszyka"
    end

  end



