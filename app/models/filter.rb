class Filter < ApplicationRecord
    has_many :job_posting_filters
    has_many :job_postings , through: :job_posting_filters
end
