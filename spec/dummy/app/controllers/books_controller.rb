class BooksController < ApplicationController

  respond_to :json

  def index
    books = Book.page(params[:page]).per(params[:per_page])
    respond_with books, serializer: ActiveModel::PaginationSerializer
  end

  def no_pagination
    books = Book.all
    respond_with books, serializer: ActiveModel::PaginationSerializer
  end

  def multiple_fields_to_count
    books = Book.select("title, created_at").all

    respond_with books, serializer: ActiveModel::PaginationSerializer
  end

  def grouped
    books = Book.page(params[:page]).per(params[:per_page]).group(:id)

    respond_with books, serializer: ActiveModel::PaginationSerializer
  end

end
