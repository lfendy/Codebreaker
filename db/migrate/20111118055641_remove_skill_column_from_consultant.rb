class RemoveSkillColumnFromConsultant < ActiveRecord::Migration
  def up
    remove_column :consultants, :skill
  end

  def down
    add_column :consultants, :skill, :integer
  end
end
