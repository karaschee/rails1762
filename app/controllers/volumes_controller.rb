class VolumesController < BaseController
  layout "player"
  def index
  end

  def show
    @vol = Volume.find(params[:id])
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    @vol_content = @vol.content.nil? ? '' : markdown.render(@vol.content).html_safe
    @timelines = @vol.timelines.order(:at_time)
    @tags = @vol.tags.order(:count)
  end
end
