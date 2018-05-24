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

end
