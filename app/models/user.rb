# Copyright (c) 2014 Michael Aaron Zeng
#
# Memento Book
#------------------------------------------------------------------------------
# == Schema Information
#
# Table name: users
#
#  id                  :integer         not null,    primary key
#  username            :string(32)      default(""), not null
#  email               :string(64)      default(""), not null
#  password_hash       :string(255)     default(""), not null
#  password_salt       :string(255)     default(""), not null
#  persistence_token   :string(255)     default(""), not null
#  perishable_token    :string(255)     default(""), not null
#  last_request_at     :datetime
#  last_login_at       :datetime
#  current_login_at    :datetime
#  last_login_ip       :string(255)
#  current_login_ip    :string(255)
#  login_count         :integer         default(0), not null
#  deleted_at          :datetime
#  created_at          :datetime
#  updated_at          :datetime
#  admin               :boolean         default(FALSE), not null
#  suspended_at        :datetime
#  single_access_token :string(255)
#

class User < ActiveRecord::Base

  acts_as_authentic

  #----------------------------------------------------------------------------
  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.password_reset_instructions(self).deliver
  end

end
