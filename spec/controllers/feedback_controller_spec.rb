# frozen_string_literal: true

RSpec.describe Europeana::FeedbackButton::FeedbackController do
  def main_app
    Rails.application.class.routes.url_helpers
  end

  routes { Europeana::FeedbackButton::Engine.routes }

  describe 'POST create' do
    let(:params) { { type: 'comment', text: 'This is good, five words!', page: main_app.root_path, privacy_policy: '1', format: :json } }

    subject { -> { post :create, params: params } }

    context 'with recipient configured' do
      before do
        Rails.application.config.x.feedback_mail_to = 'feedback@example.com'
      end

      it 'should queue an email job' do
        expect { subject.call }.to change{ActionMailer::Base.deliveries}
      end

      it 'should return 200 response' do
        subject.call
        expect(response.status).to eq(200)
      end

      it 'should return JSON' do
        subject.call
        expect(response.content_type).to eq('application/json')
      end

      it 'should include "success": "true"' do
        subject.call
        expect(JSON.parse(response.body)['success']).to be(true)
      end
    end

    context 'without recipient configured' do
      before do
        Rails.application.config.x.feedback_mail_to = nil
      end

      it 'should not queue an email job' do
        expect { subject.call }.to_not change(ActionMailer::Base.deliveries, :length)
      end

      it 'should return 500 response' do
        subject.call
        expect(response.status).to eq(500)
      end

      it 'should return JSON' do
        subject.call
        expect(response.content_type).to eq('application/json')
      end

      it 'should include "success": "false"' do
        subject.call
        expect(JSON.parse(response.body)['success']).to be(false)
      end
    end
  end
end
