class VolunteerAndSkill < ApplicationRecord
    belongs_to :skills
    belongs_to :volunteers
end
