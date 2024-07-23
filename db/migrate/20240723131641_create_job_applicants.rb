class CreateJobApplicants < ActiveRecord::Migration[7.1]
  def change
    create_table :job_applicants do |t|
      t.references :job, null: false, foreign_key: true
      t.references :applicant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
