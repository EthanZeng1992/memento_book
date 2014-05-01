module ApplicationHelper

  #--------------------------------------------------------------------------------------------
  def notice_message
    flash_messages = []
    flash.each do |type, message|
      type = :success if type.to_sym == :notice
      text = content_tag(:div, link_to("x", "#", :class => "close", "data-dismiss" => "alert") + message, :id => "flash-style", :class => "alert alert-#{type}")
      flash_messages << text if message
    end

    flash_messages.join("\n").html_safe
  end

  #--------------------------------------------------------------------------------------------
  def hidden; { :style => "display:none;" }; end

end
