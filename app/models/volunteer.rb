class Volunteer < ApplicationRecord
    self.table_name = 'Volunteer'
    has_many :skills, through: :VolunteerAndSkills
end
