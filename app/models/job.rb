class Job < ApplicationRecord
    self.table_name = 'Job'
    belongs_to :charity
end
