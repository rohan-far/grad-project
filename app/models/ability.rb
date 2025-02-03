class Ability
  include CanCan::Ability

  def initialize(employee)
    employee ||= Employee.new  

    if employee.admin?
      can :manage, :all
    else
      can :read, Employee, id: employee.id
      cannot :read, Department
    end
  end
end
