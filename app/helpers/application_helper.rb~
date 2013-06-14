module ApplicationHelper
  def li_current_page_item (selected_page, current_page, &block)
      content = with_output_buffer(&block)
      if selected_page==current_page
        content_tag(:li, content, :class => 'current_page_item ui-widget-content', :id=>current_page)
      else 
        content_tag(:li, content, :class => 'not_current_page_item ui-widget-content', :id=>current_page)
      end
  end

  def admin_link_to (*args, &block)
    if current_user&&current_user.admin?
      link_to(*args, &block)
    end
  end
  
  def admin_link_to_td (*args, &block)
    if current_user&&current_user.admin?
      content_tag(:td, link_to(*args, &block))
    end
  end
  
end
