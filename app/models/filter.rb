class Filter < ApplicationRecord
    has_many :job_posting_filters
    has_many :job_postings , through: :job_posting_filters

    def self.filter(pos)
        Filter.all.select do |filter|
          filter.position == pos
        end
    end
end
