module Admin
  class BooksController < Admin::ApplicationController
    def import
      Book.import(params[:file])
      redirect_to admin_books_url
    end

  end
end
