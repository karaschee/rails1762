class PagesController < BaseController
  def home
  end

  def search
    key = params[:key]
    tags = Tag.where("name = '"+key+"'")
    @results = tags.order(:tagable_type)
  end
end
