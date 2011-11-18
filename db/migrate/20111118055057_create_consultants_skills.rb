class CreateConsultantsSkills < ActiveRecord::Migration
  def change
    create_table :consultants_skills do |t|
      t.integer :consultant_id
      t.integer :skill_id

      t.timestamps
    end
  end
end
