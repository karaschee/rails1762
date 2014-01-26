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

  def include_related_asset(asset)
    if !Rails1762::Application.assets.find_asset(asset).nil?
      case asset.split('.')[-1]
        when 'js'
          javascript_include_tag asset
        when 'css'
          stylesheet_link_tag asset
      end
    end
  end

  def include_module(name)
    case name
      # when 'module_name'
      #   include_related_asset 'path/to/module.js'
    end
  end
end
