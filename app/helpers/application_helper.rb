module ApplicationHelper

  def navbar_t ( value )
    I18n.t value, scope: :navbar, default: value.to_s.humanize
  end
  
end
