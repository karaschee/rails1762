class Console::TimelinesController < Console::ConsoleBaseController
  def index
    @volume = Volume.find params[:volume_id]
    respond_to do |format|
      format.js {
        render json: @volume.timelines, methods: [:card_title]
      }
      format.html
    end
  end

  def create
    t = Timeline.new(timeline_params)
    if t.save
      render json: { status: 1 }
    else
      render json: { status: 0 }
    end
  end

  def destroy
    t = Timeline.find params[:id]
    t.destroy
    render json: {}
  end

  private
    def timeline_params
      params.permit(:at_time, :volume_id, :card_id)
    end
end
