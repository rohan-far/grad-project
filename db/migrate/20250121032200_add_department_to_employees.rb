class AddDepartmentToEmployees < ActiveRecord::Migration[7.1]
  def change
    add_reference :employees, :department, foreign_key: true


    reversible do |dep|
      dep.up do

      default_department = Department.create(name: "Default Department")
      Employee.update_all(department_id: default_department.id)
      end
    end
  end
end
