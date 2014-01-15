require 'spec_helper'

describe Show do
  it "has a valid factory" do
    expect(build(:show)).to be_valid
  end

  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should respond_to :name }
  it { should respond_to :desc }
  it { should respond_to :volumes }

  it "should have a association between volume and show" do
    show = create(:show)
    volume = create(:volume, show_id: show.id)

    expect(show.volumes).to match_array([volume])
    expect(volume.show).to eq show
  end
end