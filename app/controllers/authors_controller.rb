class AuthorsController < ApplicationController
  def index
    res = AuthorSerializer.new(Author.all)
    render json: res.serializable_hash, status: :ok
  end

  def show
    res = AuthorSerializer.new(Author.find_by!(id: authors_params[:id]))
    render json: res.serializable_hash, status: :ok
  end

  private

  def authors_params
    params.permit(:id)
  end
end
