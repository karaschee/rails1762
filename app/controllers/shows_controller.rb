class ShowsController < BaseController
  def index
    @shows = Show.all
    @djs = CardType.find(CardType::NAME_ID_MAP[:djs]).cards
  end

  def show
  end
end
