require 'spec_helper'

describe Console::ShowsController do

  let!(:show) { create(:show) }

  it "should set nil to show_id after deleting associated show" do
    vol = create(:volume)
    expect(vol.show_id).to_not eq nil
    delete :destroy, id: vol.show
    expect(vol.reload.show_id).to eq nil
  end

end
