class DepartmentService
    def self.list_all
        departments = Department.includes(:employees)
        if departments.any?
            {success: true, departments: departments}
        else 
            {success: false, departments: []}
        end
    end

    def self.create(params)
        department = Department.new(params)
        if department.save
            { success: true, department: department }
        else
            { success: false, errors: department.errors }
        end
    end
    def self.destroy!(department)
        if department.employees.exists?
          { success: false, error: "Cannot delete department with employees." }
        elsif department.destroy
          { success: true }
        else
          { success: false, error: department.errors.full_messages }
        end
      end
end