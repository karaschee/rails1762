require 'spec_helper'

describe Timeline do
  it "has a valid factory" do
    expect(build(:timeline)).to be_valid
  end

  it { should validate_presence_of :card_id }
  it { should validate_presence_of :volume_id }
  it { should validate_presence_of :at_time }

  it { should respond_to :card_id }
  it { should respond_to :volume_id }
  it { should respond_to :at_time }

  it { should respond_to :card }
  it { should respond_to :volume }
end
