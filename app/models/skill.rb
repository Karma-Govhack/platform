class Skill < ApplicationRecord
    self.table_name = 'Skills'
    has_many :volunteers, through: :VolunteerAndSkills
end
