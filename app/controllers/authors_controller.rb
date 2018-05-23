class AuthorsController < ApplicationController
  def index
    res = AuthorSerializer.new(Author.all)
    json_response(res.serializable_hash, :ok)
  end

  def show
    res = AuthorSerializer.new(Author.find_by!(id: authors_params[:id]))
    json_response(res.serializable_hash, :ok)
  end

  private

  def authors_params
    params.permit(:id)
  end
end
