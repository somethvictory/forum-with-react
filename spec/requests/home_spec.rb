require 'rails_helper'

RSpec.describe 'Home', type: :request do
  let!(:ruby_question) { create(:question, title: 'What is Ruby?') }
  let!(:js_question) { create(:question, title: 'What is JS') }

  describe 'Index' do
    context 'when query params included' do
      it 'filters questions' do
        get '/', params: { query: 'Ruby' }

        expect(response.body).to include('Ruby')
        expect(response.body).not_to include('JS')
      end
    end

    context 'when query params is not included' do
      it 'does not search questions' do
        get '/'

        expect(response.body).to include('Ruby')
        expect(response.body).to include('JS')
      end
    end
  end
end
