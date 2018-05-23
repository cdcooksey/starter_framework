class AuthorsController < ApplicationController
  def index
    res = AuthorSerializer.new(Author.all)
    render json: res.serializable_hash, status: :ok
  end

  def show
  end
end
