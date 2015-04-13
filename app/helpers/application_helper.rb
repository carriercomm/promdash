module ApplicationHelper
  def page_title(title = nil)
    if title
      raise ArgumentError, 'title must be a string' unless title.is_a?(String)
      content_for(:title, title)
      title
    else
      [content_for(:title), 'Prometheus Dashboard'].compact.join(' | ')
    end
  end

  def widget_page?
    ["single_widget", "embed"].include?(controller_name) ||
      "dashboards_show" == "#{controller_name}_#{action_name}"
  end

  def dashboards_active?
    %w{dashboards directories}.include? params[:controller]
  end
end
