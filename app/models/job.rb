class Job < ApplicationRecord
    self.table_name = 'Job'
    belongs_to :charity
    has_many :JobsAndSkills, foreign_key: "Job_id"
    attr_accessor :skillsRequired
end
