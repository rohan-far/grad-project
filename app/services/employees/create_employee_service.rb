class Employee::CreateEmployeeService

    def Initialize(employee_params)
        @employee_params = employee_params 
    end

    def call
        Employee.new(@employee).tap do |employee|
            return employee if employee.save
        end
    end
end