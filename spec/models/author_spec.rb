require 'rails_helper'

RSpec.describe Author, type: :model do

  let(:author) { create(:author) }
  describe 'FactoryBot' do
    it { expect(author).to be_kind_of(Author) }
  end
  describe '#full_name' do
    let(:name) { "#{author.first_name} #{author.last_name}" }
    it { expect(author.full_name).to eq(name) }
  end
end
