class Notifier < ActionMailer::Base

  default :from => "zmdyiwei@gmail.com"

  #----------------------------------------------------------------------------
  def password_reset_instructions(user)
    @reset_password_url = edit_password_url(user.perishable_token)

    mail(:to      => user.email, 
         :subject => "Memento-Book: password reset instructions",
         :from    => "Memento-Book  <zmdyiwei@gmail.com>",
         :date    => Time.now
        )
  end
end
