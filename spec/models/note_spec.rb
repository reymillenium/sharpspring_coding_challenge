require 'rails_helper'

RSpec.describe Note, type: :model do
  let(:described_object) { build note }

  it "has a valid factory" do
    expect(FactoryBot.build(:note)).to be_valid
  end


end