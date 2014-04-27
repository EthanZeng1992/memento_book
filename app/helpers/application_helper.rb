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
  def link_to_inline(text, url, id)
    text = arrow_for(id) + text
    url = url + "?cancel=false"
    link_to(text, url,
           :remote => true,
           :onclick => "this.href = this.href.replace(/cancel=(true|false)/,'cancel='+ ($('##{id}').css('display') != 'none'));")
  end
    
  #--------------------------------------------------------------------------------------------
  def arrow_for(id)
    content_tag(:span, "&#9658;".html_safe, :id => "#{id}_arrow", :class => :arrow)
  end

  #--------------------------------------------------------------------------------------------
  def hidden; { :style => "display:none;" }; end

end
