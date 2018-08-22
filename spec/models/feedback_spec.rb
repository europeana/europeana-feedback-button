# frozen_string_literal: true

RSpec.describe Europeana::FeedbackButton::Feedback do
  it { is_expected.to validate_presence_of(:text) }
  it { is_expected.to validate_presence_of(:type) }
  it { is_expected.to validate_presence_of(:page) }
  it { is_expected.to validate_inclusion_of(:type).in_array(%w(comment correction bug)) }
  it { is_expected.to validate_acceptance_of(:privacy_policy) }
  it { is_expected.to validate_length_of(:text).is_at_most(400) }

  it 'should validate that :text has at least 5 words' do
    five_words = %w(one two three four five)
    five_words.each_with_index do |_word, index|
      words = five_words[0..index]
      text = words.join(' ')
      subject.text = text
      subject.validate

      if words.size == 5
        expect(subject.errors[:text]).to be_blank
      else
        expect(subject.errors[:text]).not_to be_blank
      end
    end
  end
end
