class JobPosting < ApplicationRecord
    has_many :job_applications
    has_many :users, through: :job_applications
    has_many :bookmarks
    has_many :job_posting_filters
    has_many :filters, through: :job_posting_filters


  
    
      def for_collection_select
        self.job_posting_filter.map do |jp_filter|
          jp_filter.id
        end
      end
    
      def self.filter_position(filter_id, collection_selected_job_application)
        given_position = JobPostingFilter.find(filter_id).filter.position
        collection_selected_roster.select do |filter|
          JobPostingFilter.find(filter[0]).filter.position == given_position
        end
      end
end
