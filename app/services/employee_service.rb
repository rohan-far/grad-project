class EmployeeService
    def self.list_all
      employees = Employee.all
      if employees.any?
        { success: true, employees: employees }
      else
        { success: false, employees: [] }
      end
    end
    
    def self.create(params)
      employee = Employee.new(params)
      if employee.save
        { success: true, employee: employee }
      else
        { success: false, errors: employee.errors.full_messages }
      end
    end
  
    def self.update(employee, params)
      if employee.update(params)
        { success: true, employee: employee }
      else
        { success: false, errors: employee.errors }
      end
    end
  
    def self.destroy(employee)
      employee.destroy!
      { success: true }
    end
  end
  