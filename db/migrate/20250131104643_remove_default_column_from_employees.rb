class RemoveDefaultColumnFromEmployees < ActiveRecord::Migration[7.1]
  def change
    remove_column :employees, :default, :string
  end
end
