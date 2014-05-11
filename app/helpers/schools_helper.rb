module SchoolsHelper

  #--------------------------------------------------------------------------------------------
  def add_link 
    text = arrow + 'Add' 
    url = "/add?cancel=false"
    link_to(text, url,
           :remote => true,
           :onclick => "this.href = this.href.replace(/cancel=(true|false)/,'cancel='+ ($('#add').css('display') != 'none'));")
  end

  #--------------------------------------------------------------------------------------------
  def arrow
    content_tag(:span, "&#9658;".html_safe, :id => "add_arrow")
  end

  #--------------------------------------------------------------------------------------------
  def arrow_for_member
    content_tag(:span, "&#9658;".html_safe, :id => "arrow_for_member")
  end

  #--------------------------------------------------------------------------------------------
  def link_to_close
    text = raw('<i class="fa fa-times fa-close"></i>')
    url  = '/add?cancel=true'
    link_to(text, url, :remote => true)
  end

  #--------------------------------------------------------------------------------------------
  def link_to_return
    text = '&#9664;'.html_safe
    link_to(text, return_path, remote: true, id: 'return')
  end

  #--------------------------------------------------------------------------------------------
  def show_new_form?
    params[:cancel] == 'false' 
  end

  #--------------------------------------------------------------------------------------------
  def link_to_add(entity)
    text = raw('<div class="add-school-title">New School...</div>
                <div class="add-description">A school is a collection of groups orderd in a list of lists. use it to collect your many groups together.</div>') if entity == 'schools'

    text = raw('<div class="add-school-title">New Group...</div>
                <div class="add-description">A group is a collection of your classmates or friends, use it to collect them together.</div>') if entity == 'groups' 

    url = root_path + "#{entity}/new?cancel=false"
    link_to(text, url, remote: true)
  end
end
