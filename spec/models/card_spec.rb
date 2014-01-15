require 'spec_helper'

describe Card do
  it "has a valid factory" do
    expect(build(:card)).to be_valid
  end

  it { should validate_presence_of :title }
  it { should validate_uniqueness_of :title }

  it { should respond_to :title }
  it { should respond_to :card_type_id }
  it { should respond_to :desc }
  it { should respond_to :content }

  it { should respond_to :timelines }
  it { should respond_to :volumes }
  it { should respond_to :card_type }

  describe "title repetition" do
    let!(:carda) { create(:card) }
    let!(:cardb) { create(:card) }

    before do 
      carda.title = "same title"
      cardb.title = "same title"
      carda.save
    end

    context "in different card type" do
      it { expect(cardb).to be_valid }
    end

    context "in same card type" do
      let(:card_type) { create(:card_type) }

      before do
        carda.card_type_id = card_type.id
        cardb.card_type_id = card_type.id
        carda.save
      end

      it { expect(cardb).to_not be_valid }
    end
  end
end
