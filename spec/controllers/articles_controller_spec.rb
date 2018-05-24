require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  let(:actual) { JSON.parse(response.body) }

  describe 'GET /articles' do
    before do
      articles
      get :index
    end

    let(:articles) { create_list(:article, 3) }
    let(:expected_payload) { JSON.parse(ArticleSerializer.new(articles).serialized_json) }

    it { expect(response).to have_http_status :ok }
   
    it 'returns ArticleSerializer' do
      expect(actual).to eq(expected_payload)
    end
    context 'when no articles are found' do
      let(:articles) { [] }

      it { expect(response).to have_http_status :ok }
      it 'returns empty array' do
        expect(actual).to eq(expected_payload)
      end
    end
  end

  describe 'GET /articles/:id' do
    subject { actual }
    before { get :show, params: { id: article_id } }

    let(:article) { create(:article) }
    let(:article_id) { article.id }

    let(:expected_payload) { JSON.parse(ArticleSerializer.new(article).serialized_json) }

    it { expect(response).to have_http_status :ok }
    it { is_expected.to eq(expected_payload) }

    context 'when article is not found' do
      let(:article_id) { rand(11..9999) }
      let(:expected_payload) { { message: "Couldn't find Article" }.as_json }

      it { expect(response).to have_http_status :not_found }
      it 'should return error message' do
        expect(actual).to eq(expected_payload)
      end
    end
  end

end
