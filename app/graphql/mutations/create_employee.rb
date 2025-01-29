class Mutations::CreateEmployee < GraphQL::Schema::Mutation

    null true
    
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :email, String, required: true
    argument :yearly_salary, Float, required: true

    def resolve(first_name:, last_name:, email:, yearly_salary:)
      Employee.create(first_name: first_name, last_name: last_name, email: email, yearly_salary: yearly_salary)
    end
end