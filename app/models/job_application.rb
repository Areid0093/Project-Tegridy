class JobApplication < ApplicationRecord
  belongs_to :user_id
  belongs_to :job_id
end
