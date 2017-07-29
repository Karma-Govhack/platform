class AddSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :Skills do |t|
      t.string :name
    end
    create_table :VolunteerAndSkills do |t|
      t.integer :Volunteer_id
      t.integer :Skill_id
    end
    add_foreign_key :VolunteerAndSkills, :Volunteer
    add_foreign_key :VolunteerAndSkills, :Skills
  end
end
