class Skill < ApplicationRecord
    self.table_name = 'Skills'
    has_many :volunteers
    has_many :VolunteerAndSkills
end
