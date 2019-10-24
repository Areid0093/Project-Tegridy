class JobApplication < ApplicationRecord
  belongs_to :user
  belongs_to :job_posting
  # validates :description, length: {minimum: 25}

  # @@STATUS = ["started", "completed", "submitted"]

  # def self.status 
  #   @@STATUS
  # end
  
end
