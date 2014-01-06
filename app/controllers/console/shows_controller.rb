class Console::ShowsController < Console::ConsoleBaseController

  before_action :find_show, only: [ :edit, :update, :destroy ]

  def index
    @shows = Show.all
  end

  def new
    @show = Show.new
  end

  def edit
    render 'edit'
  end

  def create
    @show = Show.new(show_params)
    if @show.save
      redirect_to console_shows_path
    else
      render :new
    end
  end

  def update
    if @show.update(show_params)
      redirect_to console_shows_path
    else
      render :edit
    end
  end

  def destroy
    @show.destroy
    redirect_to console_shows_path
  end

  private

    def find_show
      @show = Show.find(params[:id])
    end

    def show_params
      params.require(:show).permit(:name, :desc)
    end
end
