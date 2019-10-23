class CreateJobPostingFilters < ActiveRecord::Migration[6.0]
  def change
    create_table :job_posting_filters do |t|
      t.integer :job_posting_id
      t.integer :filter_id

      t.timestamps
    end
  end
end
