class JobPosting < ApplicationRecord
    has_many :job_applications
    has_many :users, through: :job_applications
    has_many :bookmarks
    belongs_to :category
end
