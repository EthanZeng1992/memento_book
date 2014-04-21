class Notifier < ActionMailer::Base

  default :from => "ethanzeng1992@gmail.com"

  #----------------------------------------------------------------------------
  def password_reset_instructions(user)
    @reset_password_url = edit_password_url(user.perishable_token)

    mail(:to      => user.email, 
         :subject => "Memento-Book: Password Reset Instructions",
         :from    => "Memento-Book  <ethanzeng1992@gmail.com>",
         :date    => Time.now
        )
  end
end
