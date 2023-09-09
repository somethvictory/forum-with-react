require 'rails_helper'

RSpec.describe 'Answers', type: :request do
  let(:user) { create(:user) }
  let(:question) { create(:question, user: user)}
  let(:params) { {} }
  let(:request) { post "/questions/#{question.id}/answers", params: params }

  context 'when user is authenticated' do
    before { sign_in(user) }

    describe 'create' do
      context 'when all requirements are satisfied' do
        let(:params) do
          {
            answer: {
              body: 'This is the answer'
            }
          }
        end

        it 'creates a new answer' do
          expect { request }.to change(Answer, :count).by(1)
        end

        it 'redirects to root_path' do
          request

          expect(response.status).to eq(302)
          expect(response).to redirect_to(question_path(question, answer_id: question.answers.first.id))
        end
      end

      context 'when body is missing' do
        let(:params) do
          {
            answer: {
              something: 'This is the answer'
            }
          }
        end

        it 'does not create a new answer' do
          expect { request }.not_to change(Answer, :count)
        end
      end
    end

    describe 'update' do
      let(:answer) { create(:answer, user: user, question: question) }
      let(:request) { put "/questions/#{question.id}/answers/#{answer.id}", params: params}
      let(:params) do
        {
          answer: {
            body: 'This is the new answer'
          }
        }
      end

      context 'when the answer belongs to the user' do
        it 'updates the answer' do
          expect { request }.to change { answer.reload.body}.from('This is the answer').to('This is the new answer')
        end
      end

      context 'when the answer does not belong to the user' do
        let(:user1) { create(:user) }
        let(:answer) { create(:answer, question: question, user: user1) }

        it 'raises not found exception' do
          expect { request }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end
  end

  context 'whe user is not authenticated' do
    it 'redirects user to the login path' do
      request

      expect(response.status).to eq(302)
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
