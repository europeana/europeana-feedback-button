# frozen_string_literal: true

RSpec.describe Europeana::FeedbackButton do
  it 'has mail_to accessor' do
    expect(described_class).to respond_to(:mail_to)
    expect(described_class).to respond_to(:mail_to=)
    mail_to_was = described_class.mail_to
    new_mail_to = 'customer.service@example.org'
    described_class.mail_to = new_mail_to
    expect(described_class.mail_to).to eq(new_mail_to)
    described_class.mail_to = mail_to_was
  end
end
