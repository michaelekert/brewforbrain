class BooksController < ApplicationController
  before_action :set_book, only: %i[ show]

  # GET /books or /books.json
  def index
    @books = Book.all
  end

  # GET /books/1 or /books/1.json
  def show

  end

  # GET /books/new


  # GET /books/1/edit


  # POST /books or /books.json


  # PATCH/PUT /books/1 or /books/1.json


  # DELETE /books/1 or /books/1.json


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

end
