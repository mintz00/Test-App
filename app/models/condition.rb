class Condition < ActiveRecord::Base
  has_many :programs
  has_many :meals, :through => :programs

end
