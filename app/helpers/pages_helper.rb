module PagesHelper
  def render_search_filter
    content_tag :ul, class: "nav nav-tabs" do
      render_search_filter_item("全部", nil) +
      render_search_filter_item("节目", "Volume") +
      render_search_filter_item("wiki", "Card")
    end
  end

  def render_search_filter_item(title, type)
    style = params[:type] == type ? "active" : ""
    content_tag :li, class: style do
      link_to title, search_url(key: params[:key], type: type)
    end
  end
end
