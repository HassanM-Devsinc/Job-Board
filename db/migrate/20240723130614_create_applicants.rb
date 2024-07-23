class CreateApplicants < ActiveRecord::Migration[7.1]
  def change
    create_table :applicants do |t|
      t.string :name
      t.string :email
      t.string :cnic
      t.string :resume
      t.string :linkedin_profile
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
