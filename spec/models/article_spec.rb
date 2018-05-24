require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'FactoryBot' do
    let(:subject) { create(:article) }
    it { is_expected.to be_kind_of(Article) }
    it { is_expected.to respond_to(:author) }
  end
end
