class Console::CardsController < Console::ConsoleBaseController
  before_action :find_card, only: [ :show, :edit, :update, :destroy ]
  before_action :get_card_types, only: [ :new, :edit, :update, :create ]

  def index
    card_type_id = params[:card_type_id]
    if card_type_id.present?
      @card_type = CardType.find(card_type_id)
      @cards = Kaminari.paginate_array(@card_type.cards).page(params[:page])
    else
      @cards = Card.page params[:page]
    end
    respond_to do |format|
      format.js {
        render json: Card.all, methods: [:card_type_name]
      }
      format.html {}
    end
  end

  def show
  end

  def new
    @card = Card.new
  end

  def edit
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to console_cards_path
    else
      render :new
    end
  end

  def update
    if @card.update(card_params)
      redirect_to console_cards_path
    else
      render :edit
    end
  end

  def destroy
    @card.destroy
    redirect_to console_cards_path
  end

  private

    def find_card
      @card = Card.find(params[:id])
    end

    def card_params
      params.require(:card).permit(:card_type_id, :title, :desc, :content)
    end

    def get_card_types
      @card_types = CardType.all
    end
end
