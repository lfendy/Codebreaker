class Skill < ActiveRecord::Base
  has_and_belongs_to_many :consultants
  validates_uniqueness_of :name
end
