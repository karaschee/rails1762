class CardsController < BaseController
  def show
    @card = Card.find(params[:id])
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    @card_content = @card.content.nil? ? '' : markdown.render(@card.content).html_safe
    @vols = @card.volumes
  end
end
