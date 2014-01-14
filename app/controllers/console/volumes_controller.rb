class Console::VolumesController < Console::ConsoleBaseController

  before_action :find_volume, only: [ :edit, :update, :destroy ]

  def index
    show_id = params[:show_id]
    if show_id
      @show = Show.find(show_id)
      @volumes = Kaminari.paginate_array(@show.volumes).page(params[:page])
    else
      @volumes = Volume.page params[:page]
    end
  end

  def new
    @volume = Volume.new
    @shows = Show.all
    if params[:show_id].present?
      @from_show_id = params[:show_id]
    end
  end

  def edit
    @shows = Show.all
  end

  def create
    @volume = Volume.new(volume_params)
    if @volume.save
      redirect_to console_volumes_path
    else
      render :new
    end
  end

  def update
    if @volume.update(volume_params)
      redirect_to console_volumes_path
    else
      render :edit
    end
  end

  def destroy
    @volume.destroy
    redirect_to console_volumes_path
  end

  private

    def find_volume
      @volume = Volume.find(params[:id])
    end

    def volume_params
      params.require(:volume).permit(:title, :desc, :show_id)
    end
end