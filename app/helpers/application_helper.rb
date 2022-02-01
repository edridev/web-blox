module ApplicationHelper

  def tr (value, path='', icount=1)
    I18n.t value, scope: path.split('.'), default: value.to_s.humanize, count: icount
  end

  def show_messages
    btn = '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>'
    resp=""
    flash.collect do |key,msg|
      item = "#{msg}#{btn}".html_safe
      resp << content_tag(:div, item, class: "alert alert-#{key} alert-dismissible fade show")
    end
    resp.html_safe
  end

end
