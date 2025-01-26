class DepartmentService
    def self.list_all
        departments = Department.all
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
        if department.employees.any?
            { success: false, error: "Cannot delete" }
        else department.destroy
            {success: true}
        end
    end
end