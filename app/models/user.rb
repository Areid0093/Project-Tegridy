class User < ApplicationRecord
    has_secure_password
    has_many :job_applications
    has_many :job_postings, through: :job_applications
    has_many :bookmarks
    validates :username, presence: true, uniqueness: true
end
