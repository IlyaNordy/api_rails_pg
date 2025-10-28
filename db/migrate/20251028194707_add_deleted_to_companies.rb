class AddDeletedToCompanies < ActiveRecord::Migration[7.2]
  def change
    add_column :companies, :deleted, :boolean, default: false
  end
end
