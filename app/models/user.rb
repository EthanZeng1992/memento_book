# Copyright (c) 2014 Michael Aaron Zeng
#
# Memento Book
#------------------------------------------------------------------------------
# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  username          :string(255)
#  email             :string(255)
#  admin             :boolean
#  password_hash     :string(255)
#  password_salt     :string(255)
#  remember_token    :string(255)
#  persistence_token :string(255)
#  perishable_token  :string(255)
#  openid_identifier :string(255)
#  last_request_at   :datetime
#  last_login_at     :datetime
#  current_login_at  :datetime
#  last_login_ip     :string(255)
#  current_login_ip  :string(255)
#  login_count       :integer
#  deleted_at        :datetime
#  created_at        :datetime
#  updated_at        :datetime
#

class User < ActiveRecord::Base

  acts_as_authentic

  has_many :schools

  validates_presence_of :username, :email  

  #----------------------------------------------------------------------------
  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.password_reset_instructions(self).deliver
  end

end
