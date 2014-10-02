module LayoutHelper

  def css_class_active_for link_path
    link_path == current_path ? "active" : "inactive"
  end

end