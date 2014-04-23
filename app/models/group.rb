class Group < ActiveRecord::Base

  belongs_to :school
  
  validates_presence_of   :name
  validates_uniqueness_of :name, :scope => :school_id
  validates_presence_of   :school_id
end
