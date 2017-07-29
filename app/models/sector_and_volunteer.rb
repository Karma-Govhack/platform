class SectorAndVolunteer < ApplicationRecord
  self.table_name = 'SectorAndVolunteer'
  belongs_to :sector
  belongs_to :volunteers
end
