class AddNullConstraintsToJobs < ActiveRecord::Migration[7.1]
  def change
    change_column :jobs, :title, :string, null: false
    change_column :jobs, :description, :text, null: false
    change_column :jobs, :application_deadline, :datetime, null: false
  end
end
