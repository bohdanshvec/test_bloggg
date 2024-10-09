# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Question, :model do
  describe 'validations' do
    let(:question_valid) { build(:question) }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_least(2) }
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_length_of(:body).is_at_least(2) }

    it 'is valid with valid attributes' do
      expect(question_valid).to be_valid
    end

    it 'is not valid without a title' do
      question = build(:question, title: nil)
      expect(question).not_to be_valid
    end

    it 'is not valid without a body' do
      question = build(:question, body: nil)
      expect(question).not_to be_valid
    end
  end

  describe '#formatted_created_at' do
    it 'return the created_at in correct format' do
      question = create(:question, created_at: Time.zone.local(2024, 10, 3, 19, 33, 0))
      expect(question.formatted_created_at).to eq('2024-10-03 19:33:00')
    end
  end
end
