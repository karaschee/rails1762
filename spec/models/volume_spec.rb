require 'spec_helper'

describe Volume do
  it "has a valid factory" do
    expect(build(:volume)).to be_valid
  end

  it { should validate_presence_of :show_id }
  it { should validate_presence_of :title }
  it { should validate_uniqueness_of :title }

  it { should respond_to :show_id }
  it { should respond_to :title }
  it { should respond_to :desc }
  it { should respond_to :content } 
  it { should respond_to :resource }

  it { should respond_to :show }
  it { should respond_to :timelines }
  it { should respond_to :cards }

  describe "title repetition" do
    let!(:vola) { create(:volume) }
    let!(:volb) { create(:volume) }

    before do 
      vola.title = "same title"
      volb.title = "same title"
      vola.save
    end

    context "in different show" do
      it { expect(volb).to be_valid }
    end

    context "in same show" do
      let(:show) { create(:show) }

      before do
        vola.show_id = show.id
        volb.show_id = show.id
        vola.save
      end

      it { expect(volb).to_not be_valid }
    end
  end
end
