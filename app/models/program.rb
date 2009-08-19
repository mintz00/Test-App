class Program < ActiveRecord::Base
  belongs_to :meal
  belongs_to :condition
end
