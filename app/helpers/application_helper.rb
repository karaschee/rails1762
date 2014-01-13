module ApplicationHelper
  def nav_link(link_text, link_path, current_class = 'active')
    class_name = current_page?(link_path) ? current_class : ''

    content_tag(:li, class: class_name) do
      link_to link_text, link_path
    end
  end

  def if_data_present(data)
    if data.present?
      yield.html_safe
    else
      content_tag(:p, "没有相关数据。")
    end
  end
end
