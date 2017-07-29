class Volunteer < ApplicationRecord
    self.table_name = 'Volunteer'
    has_many :VolunteerAndSkills, foreign_key: "Volunteer_id"
    has_many :Sector, through: :SectorAndVolunteer
end
