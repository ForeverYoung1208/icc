ActionView::Base.sanitized_allowed_tags.replace %w(p b div span font u a ul ol li br)
ActionView::Base.sanitized_allowed_attributes.replace %w(id class style size face color target href title)