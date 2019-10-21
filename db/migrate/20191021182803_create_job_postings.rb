class CreateJobPostings < ActiveRecord::Migration[6.0]
  def change
    create_table :job_postings do |t|
      t.string :company
      t.string :position
      t.string :city
      t.string :description

      t.timestamps
    end
  end
end
