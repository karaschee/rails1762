class VolumesController < BaseController
  layout "player"
  def index
  end

  def show
    @vol = Volume.find(params[:id])
  end
end
