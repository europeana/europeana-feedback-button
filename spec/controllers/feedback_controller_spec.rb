# frozen_string_literal: true

RSpec.describe Europeana::FeedbackButton::FeedbackController do
  def main_app
    Rails.application.class.routes.url_helpers
  end

  routes { Europeana::FeedbackButton::Engine.routes }

  describe 'POST create' do
    subject { -> { post :create, params: params } }

    let(:valid_params) do
      { type: 'comment', text: 'This is good, five words!',
        page: main_app.root_path, privacy_policy: '1', format: :json }
    end
    let(:json) { JSON.parse(response.body) }

    before do
      Europeana::FeedbackButton.mail_to = mail_to
    end

    shared_examples 'feedback creation failure' do
      it 'should not queue an email job' do
        expect { subject.call }.to_not change(ActionMailer::Base.deliveries, :length)
      end

      it 'should return JSON' do
        subject.call
        expect(response.content_type).to eq('application/json')
      end

      it 'should include "success": "false"' do
        subject.call
        expect(json['success']).to be(false)
      end

      it 'should include "message"' do
        subject.call
        expect(json['message']).to be_present
      end
    end

    shared_examples 'feedback creation success' do
      it 'should queue an email job' do
        expect { subject.call }.to change(ActionMailer::Base.deliveries, :length).by(1)
      end

      it 'should have response status code 200' do
        subject.call
        expect(response.status).to eq(200)
      end

      it 'should return JSON' do
        subject.call
        expect(response.content_type).to eq('application/json')
      end

      it 'should include "success": "true"' do
        subject.call
        expect(json['success']).to be(true)
      end
    end

    context 'with recipient configured' do
      let(:mail_to) { 'feedback@example.com' }

      context 'with valid params' do
        let(:params) { valid_params }

        it_behaves_like 'feedback creation success'
      end

      context 'with invalid params' do
        let(:params) { valid_params.except(:text) }

        it_behaves_like 'feedback creation failure'

        it 'should have response status code 400' do
          subject.call
          expect(response.status).to eq(400)
        end

        it 'includes error messages' do
          subject.call
          expect(json['errors']['text']).to be_present
        end
      end
    end

    context 'without recipient configured' do
      let(:mail_to) { nil }
      let(:params) { valid_params }

      it_behaves_like 'feedback creation failure'

      it 'should have response status code 500' do
        subject.call
        expect(response.status).to eq(500)
      end
    end
  end
end
