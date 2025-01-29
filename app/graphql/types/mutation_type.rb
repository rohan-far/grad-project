# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_employee, Types::EmployeeType, mutation: Mutations::CreateEmployee
  end
end
