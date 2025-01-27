class EmployeeDecorator < Draper::Decorator
    delegate_all 

    def full_name
        "#{object.first_name} #{object.last_name}"
    end

    def salary
        if object.yearly_salary.present?
            h.number_to_currency(object.yearly_salary)
        else
            "no provided"
        end
    end

    def department_present
        if object.department.name.present?
            object.department.name
        else
            "Not assigned"
        end
    end
end