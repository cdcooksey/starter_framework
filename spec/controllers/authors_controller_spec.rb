require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do

  let(:actual) { JSON.parse(response.body) }

  describe 'GET /authors' do
    before do
      authors
      get :index
    end

    let(:authors) { create_list(:author, 3) }
    let(:expected_payload) { JSON.parse(AuthorSerializer.new(authors).serialized_json) }

    it { expect(response).to have_http_status :ok }

    it 'returns AuthorSerializer' do
      expect(actual).to eq(expected_payload)
    end

    context 'when no authors are found' do
      let(:authors) { [] }

      it { expect(response).to have_http_status :ok }
      it 'returns empty array' do
        expect(actual).to eq(expected_payload)
      end
    end
  end

  describe 'GET /authors/:id' do
    before { get :show, { params: { id: author.id } } }

    let(:author) { create(:author) }
    let(:expected_payload) { JSON.parse(AuthorSerializer.new(author).serialized_json) }

    it { expect(response).to have_http_status :ok }
    it 'returns AuthorSerializer' do
      expect(actual).to eq(expected_payload)
    end

    context 'when author is not found' do
      let(:author) { build(:author) }
      it { expect(response).to have_http_status_code :not_found }
    end
  end
end
