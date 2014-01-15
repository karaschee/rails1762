require 'spec_helper'

describe CardType do
  it "has a valid factory" do
    expect(build(:card_type)).to be_valid
  end

  it { should validate_presence_of :name }

  it { should respond_to :name }
  it { should respond_to :desc }

  it { should respond_to :cards }
end
