require 'rails_helper'

RSpec.describe Employee, type: :model do                
    let(:department) {FactoryBot.create(:department)}

    it "employee is valid" do
        employee = FactoryBot.create(:employee, department: department)
        expect(employee.department.name).to eq("Engineering")
    end
    it "has invalid first_name" do
        employee = FactoryBot.create(:employee, first_name:nil)
        expect(employee).not_to be_valid
    end
    it "has invalid last_name" do
        employee = FactoryBot.create(:employee, last_name:nil)
        expect(employee).not_to be_valid
    end
    it "has invalid email" do
        employee = FactoryBot.build(:employee, email:nil)
        expect(employee).not_to be_valid
    end
    it "has invalid with non-unique email" do
        employee1 = FactoryBot.create(:employee, email: "rohan@1.com")
        employee2 = FactoryBot.build(:employee, email: "rohan@1.com")
        expect(employee2).not_to be_valid
    end
    it "is invalid with an improperly formatted email" do
        employee = FactoryBot.build(:employee, email: "rohan.fardd.com")
        expect(employee).not_to be_valid
    end
    
    it "is invalid without a department" do
        employee = FactoryBot.build(:employee, department: nil)
        expect(employee).not_to be_valid
    end

    it "is invalid without a yearly_salary greater than 0" do
        employee = FactoryBot.create(:employee, yearly_salary: 0)
        expect(employee).not_to be_valid
    end

    it "check the role for new sign_uo employee" do
        employee = FactoryBot.create(:employee, role: nil)
        employee.valid?
    expect(employee.role).to eq("default")
    end
    it "allows set a role admin" do
        employee = FactoryBot.build(:employee, role: 'admin')
        expect(employee.role).to eq('admin')
    end
end