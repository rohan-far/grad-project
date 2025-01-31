class AddRoleToEmployees < ActiveRecord::Migration[7.1]
  def change
    add_column :employees, :role, :string
    add_column :employees, :default, :string
  end
end
