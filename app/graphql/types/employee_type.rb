class Types::EmployeeType < Types::BaseObject

    field :id, ID, null: true
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :email, String, null: false
    field :yearly_salary, Float, null: false
    field :full_name, String, null: false

    def full_name
        "#{object.first_name} #{object.last_name}"
    end
end