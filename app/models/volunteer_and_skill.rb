class VolunteerAndSkill < ApplicationRecord
    self.table_name = 'VolunteerAndSkills'
    belongs_to :skills
    belongs_to :volunteers
end
