class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @orders = Order.all
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true)
  end
end
