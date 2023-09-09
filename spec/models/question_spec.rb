require 'rails_helper'

describe Question, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:body) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:answers) }
  end

  describe '.filter' do
    let!(:ruby_question) { create(:question, title: 'What is Ruby?') }
    let!(:js_question) { create(:question, title: 'What is JS') }

    it 'filters question by title' do
      expect(described_class.filter('Ruby')).to eq([ruby_question])
    end
  end
end
