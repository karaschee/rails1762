class ShowsController < BaseController
  def index
    @shows = Show.all
  end

  def show
  end
end
