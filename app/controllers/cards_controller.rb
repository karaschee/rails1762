class CardsController < BaseController
  def show
    @card = Card.find(params[:id])
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    @card_content = @card.content.nil? ? '' : markdown.render(@card.content).html_safe
    @vols = @card.volumes.order(:no).uniq
  end

  def index
    card_type_id = params[:card_type_id]
    if card_type_id.present?
      @card_type = CardType.find(card_type_id)
      @cards = Kaminari.paginate_array(@card_type.cards).page(params[:page])
    else
      @cards = Card.page(params[:page])
    end
    @card_types = CardType.all
  end
end
