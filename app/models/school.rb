class School < ActiveRecord::Base

  belongs_to :user
  has_many   :groups

  validates_presence_of   :name 
  validates_uniqueness_of :name, :scope => :user_id
  validates_presence_of   :user_id

end
