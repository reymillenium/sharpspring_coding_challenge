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

  describe '.visible_by' do
    let(:current_user) { create :user }
    let(:other_user) { create :user }

    let!(:notes_created_by_current_user) { 2.times.map { create :note, user: current_user } }
    let!(:notes_created_by_other_user) { 2.times.map { create :note, user: other_user } }

    it 'should be defined' do
      expect(described_class).to respond_to :visible_by
    end

    it 'should return an active record relationship' do
      expect(described_class.visible_by(current_user)).to be_a ActiveRecord::Relation
    end

    it 'should return all the notes created by the current user' do
      expect(described_class.visible_by(current_user.id)).to match_array notes_created_by_current_user
    end

    it 'should not return any note when the current user is nil' do
      expect(described_class.visible_by(nil)).to be_empty
    end
  end
end