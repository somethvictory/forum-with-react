require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    subject { build(:user) }

    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end

  describe 'associations' do
    it { is_expected.to have_many(:questions) }
    it { is_expected.to have_many(:answers) }
  end
end
