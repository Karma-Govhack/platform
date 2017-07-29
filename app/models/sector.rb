class Skill < ApplicationRecord
    has_many :volunteers, through: :VolunteerAndSkills
end
