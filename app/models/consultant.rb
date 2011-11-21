class Consultant < ActiveRecord::Base
  has_and_belongs_to_many :skills
  accepts_nested_attributes_for :skills

  def skills_attributes=(attributes)
    attributes.each do |attr|
      self.skills << Skill.find_or_create_by_name(attr[:name])
    end
  end

end
