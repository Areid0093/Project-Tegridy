class User < ApplicationRecord
    has_many :job_applications
    has_many :jobs, through: :job_applications
    has_many :bookmarks
end
