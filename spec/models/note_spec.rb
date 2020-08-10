require 'rails_helper'

RSpec.describe Note, type: :model do
  let(:described_object) { build :note }

  it "has a valid factory" do
    expect(FactoryBot.build(:note)).to be_valid
  end

  describe '#user' do
    it 'should be defined' do
      expect(described_object).to respond_to :user
    end

    it 'should be a belongs_to relationship' do
      expect(described_object).to belong_to(:user).class_name('User')
    end
  end

  describe '#title' do
    it 'should be defined' do
      expect(described_object).to respond_to :title
    end

    it 'should be required' do
      described_object.title = nil
      expect(described_object).to_not be_valid
    end
  end

  describe '#body' do
    it 'should be defined' do
      expect(described_object).to respond_to :body
    end
  end
end