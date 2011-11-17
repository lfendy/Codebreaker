class CreateConsultants < ActiveRecord::Migration
  def change
    create_table :consultants do |t|
      t.string :name
      t.string :email
      t.string :role
      t.string :grade
      t.string :skill

      t.timestamps
    end
  end
end
