class VolumesController < BaseController
  layout "player"
  def index
  end

  def show
    @vol = Volume.find(params[:id])
    @vols = @vol.show.volumes.order(:no)

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    @vol_content = @vol.content.nil? ? '' : markdown.render(@vol.content).html_safe

    @timelines = @vol.timelines.order(:at_time)
    @tags = @vol.tags.order(count: :desc).limit(10)

    @next = @vols.where(["no > ?", @vol.no]).first
    @next ||= @vols.first
    @prev = @vols.where(["no < ?", @vol.no]).first
    @prev ||= @vols.last
  end
end
