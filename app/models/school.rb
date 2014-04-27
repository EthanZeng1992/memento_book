# == Schema Information
#
# Table name: schools
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  user_id    :integer
#  deleted_at :datetime
#  created_at :datetime
#  updated_at :datetime
#

class School < ActiveRecord::Base

  belongs_to :user
  has_many   :groups

  validates_presence_of   :name 
  validates_uniqueness_of :name, :scope => :user_id
  validates_presence_of   :user_id

  scope :ordered, -> { order(updated_at: :desc) }

end
