class Employee::UpdateEmployeeService
    def Initialize(employee, employee_params)
        @employee = employee
        @employee_params = employee_params
    end

    def call 
        employee.tap do |employee|
            return employee if employee.update(@employee_params)
        end
    end
end