class CreateJobApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :job_applications do |t|
      t.string :status
      t.integer :user_id
      t.integer :job_id

      t.timestamps
    end
  end
end
