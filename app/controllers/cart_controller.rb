class CartController < ApplicationController
  before_action :authenticate_user!


  def show
    @cart = current_cart
  end

  def edit
    @cart = current_cart
    @cart.build_address if @cart.address.blank?
  end

  def update
    @cart = current_cart
    if @cart.update(cart_attributes)
      @cart.update_attribute(:shipping_cost, @cart.shipping_type.cost)
      redirect_to confirmation_cart_path
    else
      render action: :edit
    end
  end

  def confirmation
    @cart = current_cart
  end

  def finish
    @cart = current_cart
    session.delete(:order_id)
    flash[:notice] = "Dziękujemy za zamówienie!"
    redirect_to root_path
  end

  def add_item
    order = current_cart_or_create
    book = Book.find(params[:book_id])
    if item = order.line_items.where(book: book).first
      item.quantity += 1
      if book.quantity == 0
        flash[:error] = "Nie ma tyle sztuk na magazynie"
      else
        book.quantity -= 1
      item.save
      book.save!
      flash[:notice] = "Dodano produkt do koszyka"
      end
    else
      book.quantity -= 1
      order.line_items.create book: book,
                              quantity: 1,
                              unit_price: book.price,
                              item_name: book.name
      flash[:notice] = "Dodano produkt do koszyka"
      book.save!

    end
    redirect_to root_path
  end

  def remove_item
    order = current_cart
    book = Book.find(params[:book_id])
    if item = order.line_items.where(book: book).first
    book.quantity = item.quantity
    if item
      item.destroy
    end
    book.save!
    end
    redirect_to root_path, notice: "Usunięto produkt z koszyka"
  end

  private

  def cart_attributes
    params.require(:order).permit(
      :shipping_type_id,
      :comment,
      :user_id,
      :address_attributes => [
        :first_name,
        :last_name,
        :city,
        :zip_code,
        :street,
        :email
      ]
    )
  end
end



