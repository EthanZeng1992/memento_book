# == Schema Information
#
# Table name: members
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  phone      :string(255)
#  QQ         :string(255)
#  address    :string(255)
#  group_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Member < ActiveRecord::Base

  belongs_to :group

  validates_presence_of   :name
  validates_uniqueness_of :name, :scope => :group_id
  validates_presence_of   :group_id
end
