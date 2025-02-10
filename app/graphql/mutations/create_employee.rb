class Mutations::CreateEmployee < GraphQL::Schema::Mutation

    null true

    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :email, String, required: true
    argument :yearly_salary, Float, required: true
    argument :department_id, ID, required: true

    field :employee, Types::EmployeeType, null: true
    field :errors, [String], null: false

    def resolve(first_name:, last_name:, email:, yearly_salary:, department_id:)
        department = Department.find(department_id)
        return { employee: nil, errors: ["Department not found"] } unless department
      
        employee = Employee.new(first_name: first_name, last_name: last_name, email: email, department: department, yearly_salary: yearly_salary)
      
        if employee.save
            employee
        else
            { employee: nil, errors: employee.errors.full_messages }
        end
      end      
end