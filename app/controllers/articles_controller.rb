class ArticlesController < ApplicationController
  def index
    res = ArticleSerializer.new(Article.all)
    json_response(res.serializable_hash, :ok)
  end

  def show
    res = ArticleSerializer.new(Article.find_by!(id: article_params[:id]))
    json_response(res.serializable_hash, :ok)
  end

  private

  def article_params
    params.permit(:id)
  end
end
