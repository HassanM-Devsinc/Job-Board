class ChangeDefaultValuesInApplicantsToNil < ActiveRecord::Migration[7.1]
  def change
    change_column_default :applicants, :name, nil
    change_column_default :applicants, :email, nil
    change_column_default :applicants, :cnic, nil
    change_column_default :applicants, :resume, nil
    change_column_default :applicants, :linkedin_profile, nil
  end
end
