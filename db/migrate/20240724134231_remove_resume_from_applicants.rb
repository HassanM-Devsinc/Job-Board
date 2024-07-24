class RemoveResumeFromApplicants < ActiveRecord::Migration[7.1]
  def change
    remove_column :applicants, :resume, :string
  end
end
