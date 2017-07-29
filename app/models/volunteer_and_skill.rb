class VolunteerAndSkill < ApplicationRecord
    self.table_name = 'VolunteerAndSkills'
    belongs_to :Skills
    belongs_to :Volunteers
end
