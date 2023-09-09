require 'rails_helper'

describe Answer, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:body) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:question) }
  end
end
