class CardTypesController < BaseController
  def index
    @cardtypes = CardType.all
  end

  def show
  end
end
