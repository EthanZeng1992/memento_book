# Copyright (c) 2014 Michael Aaron Zeng
#
# Memento Book
#------------------------------------------------------------------------------
# == Schema Information
#
# Table name: users
#
#  id                  :integer
#  username            :string
#  email               :string
#  password_hash       :string
#  password_salt       :string
#  persistence_token   :string
#  perishable_token    :string
#  last_request_at     :datetime
#  last_login_at       :datetime
#  current_login_at    :datetime
#  last_login_ip       :string
#  current_login_ip    :string
#  login_count         :integer
#  deleted_at          :datetime
#  created_at          :datetime
#  updated_at          :datetime
#  admin               :boolean
#  suspended_at        :datetime
#  single_access_token :string
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
