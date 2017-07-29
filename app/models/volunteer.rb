class Volunteer < ApplicationRecord
    self.table_name = 'Volunteer'
    has_many :skills, through: :VolunteerAndSkills
    has_many :sector, through: :SectorAndVolunteer
end
