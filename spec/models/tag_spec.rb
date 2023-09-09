require 'rails_helper'

describe Tag, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:question_tags) }
    it { is_expected.to have_many(:questions).through(:question_tags) }
  end

  describe '.filter' do
    let!(:ruby) { create(:tag, name: 'Ruby') }
    let!(:js) { create(:tag, name: 'Javascript') }

    it 'filters question by title' do
      expect(described_class.filter('Ru')).to eq([ruby])
    end
  end
end
