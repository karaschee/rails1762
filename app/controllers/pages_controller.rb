class PagesController < BaseController
  def home
    @djs = CardType.find(CardType::NAME_ID_MAP[:djs]).cards.limit(4)
    @volumes = Volume.first(6)
  end

  def search
    key = params[:key]
    type = params[:type]
    tags = Tag.where(["name = ?", key])

    if type.present?
      results = tags.where(["tagable_type = ?", type])
    else
      results = tags.order(:tagable_type)
    end
    @results = Kaminari.paginate_array(results).page(params[:page])
    @key = key
  end
end
