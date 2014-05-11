module MembersHelper
  def add_member 
    text = arrow_for_member + 'Add'
    url = "/add_member?cancel=false"
    link_to(text, url,
           :remote => true,
           :onclick => "this.href = this.href.replace(/cancel=(true|false)/,'cancel='+ ($('#add_member').css('display') != 'none'));")
  end
end
