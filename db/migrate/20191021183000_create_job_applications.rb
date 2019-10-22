class CreateJobApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :job_applications do |t|
      t.string :status
      t.text :description
      t.integer :user_id
      t.integer :job_posting_id
      t.text :description

      t.timestamps
    end
  end
end
