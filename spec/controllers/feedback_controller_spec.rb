RSpec.describe Europeana::FeedbackButton::FeedbackController do
  def main_app
    Rails.application.class.routes.url_helpers
  end

  describe 'POST create' do
    let(:params) { { locale: 'en', type: 'comment', text: 'This is good, five words!', url: main_app.root_path(locale: 'en') } }
    subject { post :create, params }

    context 'with recipient configured' do
      before do
        Rails.application.config.x.feedback_mail_to = 'feedback@example.com'
      end

      it "should queue an email job" do
        expect { subject }.to change(ActionMailer::Base.deliveries, :length)
      end
      #it '' do
      #  message_delivery = instance_double(ActionMailer::MessageDelivery)
      #  expect(ServiceMailer).to receive(:new_user).with(@user).and_return(message_delivery)
      #  expect(message_delivery).to receive(:deliver_later)
      #  subject
        #expect { subject }.to change { Delayed::Job.where("handler LIKE '%FeedbackMailer%'").count }.by(1)
      #end
    end

    context 'without recipient configured' do
      before do
        Rails.application.config.x.feedback_mail_to = nil
      end

      it 'should not queue an email job' do
        expect { subject }.to_not change(ActionMailer::Base.deliveries, :length)
      end
    end
  end
end
