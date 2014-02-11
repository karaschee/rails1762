class VolumesController < ApplicationController
  def fetch_timelines
    vol = Volume.find params[:id]
    render json: vol.timelines
  end
end
