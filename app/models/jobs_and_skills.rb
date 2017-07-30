class JobsAndSkill < ApplicationRecord
  self.table_name = 'JobsAndSkills'
  belongs_to :Jobs
end
