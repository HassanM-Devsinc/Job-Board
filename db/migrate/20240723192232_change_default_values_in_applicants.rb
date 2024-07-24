class ChangeDefaultValuesInApplicants < ActiveRecord::Migration[7.1]
  def change
    change_column_default :applicants, :name, ""
    change_column_default :applicants, :email, ""
    change_column_default :applicants, :cnic, ""
    change_column_default :applicants, :resume, ""
    change_column_default :applicants, :linkedin_profile, ""
  end
end
