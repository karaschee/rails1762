class Console::CardTypesController < Console::ConsoleBaseController

  before_action :find_card_type, only: [ :show, :edit, :update, :destroy ]

  def index
    @card_types = CardType.page(params[:page])
  end

  def show
  end

  def new
    @card_type = CardType.new
  end

  def edit
  end

  def create
    @card_type = CardType.new(card_type_params)
    if @card_type.save
      redirect_to console_card_types_path
    else
      render :new
    end
  end

  def update
    if @card_type.update(card_type_params)
      redirect_to console_card_types_path
    else
      render :edit
    end
  end

  def destroy
    @card_type.destroy
    redirect_to console_card_types_path
  end

  private

    def find_card_type
      @card_type = CardType.find(params[:id])
    end

    def card_type_params
      params.require(:card_type).permit(:name, :desc)
    end
end
