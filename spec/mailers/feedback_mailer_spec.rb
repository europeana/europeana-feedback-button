# frozen_string_literal: true

RSpec.describe Europeana::FeedbackButton::FeedbackMailer do
  describe '#post' do
    subject { -> { described_class.post(**args) } }
    let(:mail) { subject.call }

    let(:args) do
      { type: 'comment', text: 'This is good, five words!',
        page: 'http://www.example.org/', email: 'me@example.org' }
    end

    before do
      Europeana::FeedbackButton.mail_to = mail_to
    end

    context 'with recipient configured' do
      let(:mail_to) { 'feedback@example.com' }

      it 'sends mail to the recipient' do
        expect(mail.to).to include(mail_to)
      end

      it 'uses text for the subject' do
        expect(mail.subject).to eq(args[:text])
      end

      it 'includes feedback type in the body' do
        expect(mail.body.encoded).to include("Type: #{args[:type]}")
      end

      it 'includes feedback text in the body' do
        expect(mail.body.encoded).to match(/Text:\R#{args[:text]}/)
      end

      it 'includes email in the body' do
        expect(mail.body.encoded).to include("Email: #{args[:email]}")
      end

      it 'includes page URL in the body' do
        expect(mail.body.encoded).to include("URL: #{args[:page]}")
      end
    end

    context 'without recipient configured' do
      let(:mail_to) { nil }

      it 'raises exception' do
        expect(Europeana::FeedbackButton).not_to be_enabled
        expect { mail.body }.to raise_exception(Europeana::FeedbackButton::NoRecipientError)
      end
    end
  end
end
