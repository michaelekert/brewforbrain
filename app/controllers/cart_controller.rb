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
    if item = order.line_items.where(book: book).first
      item.quantity += 1
      if item.quantity > book.quantity
        flash[:error] = "Nie ma tyle sztuk na magazynie"
      else
      item.save
      end
    else
      order.line_items.create book: book,
                              quantity: 1,
                              unit_price: book.price,
                              item_name: book.name
      flash[:notice] = "Dodano produkt do koszyka"
    end
    redirect_to root_path
  end

  def remove_item
    order = current_cart
    book = Book.find(params[:book_id])
    item = order.line_items.where(book: book).first
    if item
      item.destroy
    end
    redirect_to :back, notice: "Usunięto produkt z koszyka"
  end
end



