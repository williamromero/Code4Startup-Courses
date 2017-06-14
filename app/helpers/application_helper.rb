module ApplicationHelper

  def flash_messages
    return if flash.empty?
    messages = flash.map do |key, value|
      if key == 'notice'
        content_tag(:div, value, class: 'success')
      elsif key == 'alert'
        content_tag(:div, value, class: 'error')
      end
    end
    safe_join(messages)
  end

end
