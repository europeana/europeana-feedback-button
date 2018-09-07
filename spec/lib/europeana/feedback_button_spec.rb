# frozen_string_literal: true

RSpec.describe Europeana::FeedbackButton do
  describe '@mail_to' do
    it 'has accessor' do
      expect(described_class).to respond_to(:mail_to)
      expect(described_class).to respond_to(:mail_to=)
    end
  end

  describe '@privacy_policy_url' do
    it 'has accessor' do
      expect(described_class).to respond_to(:privacy_policy_url)
      expect(described_class).to respond_to(:privacy_policy_url=)
    end

    it 'defaults to Europeana::FeedbackButton::PRIVACY_POLICY_URL' do
      expect(described_class.privacy_policy_url).to eq(Europeana::FeedbackButton::PRIVACY_POLICY_URL)
    end
  end
end
