# frozen_string_literal: true

RSpec.describe Europeana::FeedbackButton do
  describe '.mail_to' do
    it 'has accessor' do
      expect(described_class).to respond_to(:mail_to)
      expect(described_class).to respond_to(:mail_to=)
      mail_to_was = described_class.mail_to
      new_mail_to = 'customer.service@example.org'
      described_class.mail_to = new_mail_to
      expect(described_class.mail_to).to eq(new_mail_to)
      described_class.mail_to = mail_to_was
    end

    it 'defaults to nil' do
      expect(described_class.mail_to).to be_nil
    end
  end

  describe '.privacy_policy_url' do
    it 'has accessor' do
      expect(described_class).to respond_to(:privacy_policy_url)
      expect(described_class).to respond_to(:privacy_policy_url=)
      privacy_policy_url_was = described_class.privacy_policy_url
      new_privacy_policy_url = 'https://www.europeana.eu/portal/rights/privacy.html'
      described_class.privacy_policy_url = new_privacy_policy_url
      expect(described_class.privacy_policy_url).to eq(new_privacy_policy_url)
      described_class.privacy_policy_url = privacy_policy_url_was
    end

    it 'defaults to Europeana::FeedbackButton::PRIVACY_POLICY_URL' do
      expect(described_class.privacy_policy_url).to eq(Europeana::FeedbackButton::PRIVACY_POLICY_URL)
    end
  end
end
