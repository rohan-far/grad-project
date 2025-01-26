class DepartmentServise
    def self.list_all
        Department.all
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
        if department.employees.exist?
            { success: false, error: "Cannot delete" }
        else department.destroy
            {success: true}
    end

end