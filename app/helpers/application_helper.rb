module ApplicationHelper
  def nav_link(link_text, link_path, current_class = 'active')
    class_name = current_page?(link_path) ? current_class : ''

    content_tag(:li, class: class_name) do
      link_to link_text, link_path
    end
  end

  def if_data_present(data, args={is_show: nil, tip: "没有相关数据。"}, &block)
    content = capture(&block)
    if args[:is_show].nil? ? data.present? : args[:is_show] 
      content
    else
      content_tag(:p, args[:tip])
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
      when 'module_name'
#        include_related_asset 'path/to/module.js'
    end
  end

  def latest_vol
    Volume.first
  end

  def thumb_image_path(belongto, version=:ss)
    begin
      if version == :origin
        url = belongto.thumb_image.asset_url
      else
        url = belongto.thumb_image.asset_url(version)
      end
    rescue
      url = ""
    end
    if url.present?
      url
    else
      "/default_thumb_images/#{version}.jpg"
    end
  end
end
