class AddNotNullConstraintsToApplicants < ActiveRecord::Migration[7.1]
  def change
    change_column :applicants, :name, :string, null: false
    change_column :applicants, :email, :string, null: false
    change_column :applicants, :cnic, :string, null: false
    change_column :applicants, :resume, :string, null: false
    change_column :applicants, :linkedin_profile, :string, null: false
  end
end
