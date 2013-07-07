module ApplicationHelper

  def admin_link_to(section, *args, &block)
    if current_user&&current_user.redactor?(section)
      link_to(*args, &block)
    end
  end

end
