module ApplicationHelper
  def render_villas_menu
    handle_area = proc do |areas|
      ''.tap do |out|
        areas.each do |area|
          out << if area.children.any?
            content_tag(:li, class: 'has-dropdown') do
              ''.tap do |out|
                out << link_to(area.name, '#')
                out << content_tag(:ul, class: 'dropdown') { handle_area[area.children.includes(:children)] }
              end.html_safe
            end
          else
            content_tag(:li) do
              link_to area.name, '#'
            end
          end
        end
      end.html_safe
    end

    content_tag(:ul, class: 'dropdown') do
      handle_area[Area.roots.includes(:children)]
    end
  end

  def logo
    if request.host == 'jqvillas.com'
      link_to image_tag('logo.png', size: '150x57'), root_url
    elsif @phuket
      link_to "ZAP estate", root_url
    else
      link_to "Luxury Rentals & Sales", root_url
    end
  end
end
