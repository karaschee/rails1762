require 'spec_helper'

describe Volume do
  it "has a valid factory" do
    expect(build(:volume)).to be_valid
  end

  it { should validate_presence_of :title }
  it { should validate_uniqueness_of :title }
  it { should respond_to :title }
  it { should respond_to :desc }
  it { should respond_to :resource }
  it { should respond_to :show }
  # it { should respond_to :timelines }
end
