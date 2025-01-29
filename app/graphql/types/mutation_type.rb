# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    
    field :create_employee, Types::EmployeeType, null: true do 
      argument :first_name, String, required: true
      argument :last_name, String, required: true
      argument :email, String, required: true
      argument :yearly_salary, Float, required: true
    end

    def create_employee(first_name:, last_name:, email:, yearly_salary:)
      
      Employee.create(first_name: first_name, last_name: last_name, email: email, yearly_salary: yearly_salary)
    end
  end
end
