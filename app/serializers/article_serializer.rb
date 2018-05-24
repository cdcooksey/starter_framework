class ArticleSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :post, :author_id
end
