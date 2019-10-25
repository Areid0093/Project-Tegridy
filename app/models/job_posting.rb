class JobPosting < ApplicationRecord
    has_many :job_applications
    has_many :users, through: :job_applications
    has_many :bookmarks
    has_many :job_posting_filters
    has_many :filters, through: :job_posting_filters

end
