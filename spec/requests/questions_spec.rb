require 'rails_helper'

RSpec.describe 'Questions', type: :request do

  context 'when user is authenticated' do
    let(:user) { create(:user) }

    before { sign_in(user) }

    describe 'create' do
      let(:request) { post '/questions', params: params }
      let(:params) { {} }

      context 'when all requirements are satisfied' do
        let(:params) do
          {
            question: {
              title: 'What is Rails?',
              body: 'What is the difference between Ruby and Rails?'
            }
          }
        end

        it 'creates a new questions' do
          expect { request }.to change(Question, :count).by(1)
        end

        it 'redirects to root_path' do
          request

          expect(response.status).to eq(302)
          expect(response).to redirect_to(root_path)
        end
      end

      context 'when title is missing' do
        let(:params) do
          {
            question: {
              body: 'What is the difference between Ruby and Rails?'
            }
          }
        end

        it 'does not create a new questions' do
          expect { request }.not_to change(Question, :count)
        end
      end

      context 'when body is missing' do
        let(:params) do
          {
            question: {
              title: 'What is Rails?'
            }
          }
        end

        it 'does not create a new questions' do
          expect { request }.not_to change(Question, :count)
        end
      end
    end

    describe 'update' do
      let(:question) { create(:question, user: user) }
      let(:request) { put "/questions/#{question.id}", params: params}
      let(:params) do
        {
          question: {
            title: 'This is a new title'
          }
        }
      end

      context 'when the question belongs to the user' do
        it 'updates the question' do
          expect { request }.to change { question.reload.title }.from('What is Ruby?').to('This is a new title')
        end
      end

      context 'when the question does not belong to the user' do
        let(:user1) { create(:user) }
        let(:question) { create(:question, user: user1) }

        it 'raises not found exception' do
          expect { request }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end
  end

  context 'whe user is not authenticated' do
    let(:request) { post '/questions', params: params }
    let(:params) { {} }

    it 'redirects user to the login path' do
      request

      expect(response.status).to eq(302)
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
