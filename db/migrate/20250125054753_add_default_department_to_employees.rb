class AddDefaultDepartmentToEmployees < ActiveRecord::Migration[7.1]
  def up
    engineering = Department.find_or_create_by(name: 'Engineering')
    change_column_default :employees, :department_id, engineering.id
  end

  def down
    change_column_default :employees, :department_id, nil
  end
end
