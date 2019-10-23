class JobPostingFilter < ApplicationRecord
    belongs_to :filter 
    belongs_to :job_posting
end
