# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  school_id  :integer
#  deleted_at :datetime
#  created_at :datetime
#  updated_at :datetime
#

class Group < ActiveRecord::Base

  belongs_to :school
  
  validates_presence_of   :name
  validates_uniqueness_of :name, :scope => :school_id
  validates_presence_of   :school_id
end
