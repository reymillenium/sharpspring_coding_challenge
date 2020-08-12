# frozen_string_literal: true

require 'rails_helper'

describe NoteService do
  let(:described_object) { build :note }

  describe '.build_note' do
    let(:current_user) { FactoryBot.create :user }
    let(:original_note) { build :note, user: current_user }
    let(:params) { ActionController::Parameters.new(original_note.attributes.with_indifferent_access).permit! }
    let(:built_note) { described_class.build_note(params) }

    it 'should be defined' do
      expect(described_class).to respond_to :build_note
    end

    it 'should return a note object with the same main attributes than the original params' do
      ignored_columns = %w[id created_at updated_at]
      expect(built_note.attributes.except(*ignored_columns)).to eq original_note.attributes.except(*ignored_columns)
    end

    it 'should return a Note object' do
      expect(built_note).to be_a Note
    end

    it 'should not persist the returned instance' do
      expect(built_note).not_to be_persisted
    end
  end

  describe '.update_note' do
    let(:current_user) { FactoryBot.create :user }
    let!(:original_note) { create :note, user: current_user }
    let(:params) { original_note.attributes.with_indifferent_access }
    let(:updated_note) { described_class.update_note(params) }

    it 'should be defined' do
      expect(described_class).to respond_to :update_note
    end

    it 'should return a Note' do
      expect(updated_note).to be_a Note
    end

    it 'should return a note with the same main attributes than the original' do
      ignored_columns = %w[updated_at]
      expect(updated_note.attributes.except(*ignored_columns)).to eq original_note.attributes.except(*ignored_columns)
    end

    it 'should persist the returned instance' do
      expect(updated_note).to be_persisted
    end
  end

  describe '.generate_clone_from_original' do
    let(:current_user) { FactoryBot.create :user }
    let!(:original_note) { create :note, user: current_user }
    let(:clone_from_original_note) { described_class.generate_clone_from_original(original_note) }

    it 'should be defined' do
      expect(described_class).to respond_to :generate_clone_from_original
    end

    it 'should return a Note object' do
      expect(described_class.generate_clone_from_original(original_note)).to be_a Note
    end

    it 'should return a Note with the same original ActionText::RichtText body of its body field' do
      expect(clone_from_original_note.body.body).to eq original_note.body.body
    end

    it 'should return a Note object with the same main properties than the original' do
      ignored_columns_in_clones = %w[id title created_at updated_at]
      expect(clone_from_original_note.attributes.except(*ignored_columns_in_clones)).to eq original_note.attributes.except(*ignored_columns_in_clones)
    end

    it 'should not persist the returned instance' do
      expect(clone_from_original_note).not_to be_persisted
    end

    it 'should return a Note with a title that begins the same way than the title of the original one' do
      expect(clone_from_original_note.title.start_with?(original_note.title)).to be_truthy
    end

    it 'should return a Note with a title that ends in a certain format (including a time stamp):' do
      possible_time_stamp = clone_from_original_note.title[-17..-1]
      format_ok = possible_time_stamp.match(/\d{4}-\d{2}-\d{2}-\d{6}/)
      parseable = Date.strptime(possible_time_stamp, '%Y-%m-%d') rescue false

      expect(format_ok && parseable).to be_truthy
    end
  end
end