class Meal < ActiveRecord::Base
  has_many :programs
  has_many :conditions, :through => :programs
end
