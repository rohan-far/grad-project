require 'rails_helper'

RSpec.describe Employee, type: :model do
    it "is valid with valid attributes" do
        employee = FactoryBot.build(:employee)
        expect(employee).to be_valid
    end
    it "has invalid first_name" do
        employee = FactoryBot.build(:employee, first_name:nil)
        expect(employee).not_to be_valid
    end
    it "has invalid last_name" do
        employee = FactoryBot.build(:employee, last_name:nil)
        expect(employee).not_to be_valid
    end
    it "has invalid email" do
        employee = FactoryBot.build(:employee, email:nil)
        expect(employee).not_to be_valid
    end
    it "has invalid with non-unique email" do
        FactoryBot.create(:employee, email: "rohan@1.com")
        employee = FactoryBot.build(:employee, email: "rohan@1.com")
        expect(employee).not_to be_valid
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
        employee = FactoryBot.build(:employee, yearly_salary: 0)
        expect(employee).not_to be_valid
      end
end