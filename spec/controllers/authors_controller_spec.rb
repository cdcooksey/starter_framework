require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do

  let(:actual) { JSON.parse(response.body) }

  describe 'GET /authors' do
    let(:authors) { create_list(:author, 3) }
    let(:expected_payload) { JSON.parse(AuthorSerializer.new(authors).serialized_json) }

    before do
      authors
      get :index
    end
    it { expect(response).to have_http_status(200) }

    it 'returns AuthorSerializer' do
      expect(actual).to eq(expected_payload)
    end
    context 'when no authors are found' do
      let(:authors) { [] }

      it { expect(response).to have_http_status(200) }
      it 'returns empty array' do
        expect(actual).to eq(expected_payload)
      end
    end
  end
end
