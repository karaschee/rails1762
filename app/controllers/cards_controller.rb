class CardsController < ApplicationController
  def show
    @card = Card.find(params[:id])
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    pp markdown.render(@card.content)
    @card_content = @card.content.nil? ? '' : markdown.render(@card.content).html_safe
  end
end
