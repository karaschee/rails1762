require 'spec_helper'

describe Console::ShowsController do

  let!(:show) { create(:show) }
  
  describe "GET 'index'" do

    before do
      get :index
    end

    it "populates an array of shows" do
      expect(assigns(:shows)).to match_array [show]
    end

    it "renders the index view" do
      expect(response).to render_template :index
    end
  end

  describe "GET 'new'" do
    before do
      get :new
    end

    it "assigns a new Show to @show" do
      expect(assigns(:show)).to be_a_new(Show)
    end

    it "renders the :new template" do
      expect(response).to render_template :new
    end
  end

  describe "GET 'edit'" do
    before do
      get :edit, id: show
    end

    it "assigns the requested show to @show" do
      expect(assigns(:show)).to eq show
    end

    it "renders the :edit template" do
      expect(response).to render_template :edit
    end
  end

  describe "POST 'create'" do
    context "with valid data" do
      before do
        post :create, show: attributes_for(:show)
      end

      it "create a new show" do
        expect(Show.exists?(assigns[:show])).to be_true
      end

      it "redirects to index" do
        expect(response).to redirect_to console_shows_path
      end
    end

    context "with invalid data" do
      before do
        post :create, show: attributes_for(:invalid_show)
      end

      it "create a new show" do
        expect(Show.exists?(assigns[:show])).to be_false
      end

      it "redirects to index" do
        expect(response).to render_template :new
      end
    end
  end

  pending "GET 'update'" do
  end

end
