class JobApplication < ApplicationRecord
  belongs_to :user
  belongs_to :job_posting
  # validates :description, length: {minimum: 25}
end
