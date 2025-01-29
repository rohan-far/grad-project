class Mutations::CreateEmployee < GraphQL::Schema::Mutation

    null true

    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :email, String, required: true
    argument :yearly_salary, Float, required: true
    argument :department_id, ID, required: true

    def resolve(first_name:, last_name:, email:, yearly_salary:, department_id:)
        department = Department.find(department_id)
        Employee.create!(first_name: first_name, last_name: last_name, email: email, department: department, yearly_salary: yearly_salary)
    end
end