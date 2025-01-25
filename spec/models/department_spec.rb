require 'rails_helper'

RSpec.describe Department, type: :model do 
  it "should have model" do 
    department = FactoryBot.build(:department)
    expect(department).to be_valid
  end
  it "invalid without name" do
    department = FactoryBot.build(:department, name:nil)
    expect(department).not_to be_valid
  end
  it "has many employee" do
    department = FactoryBot.create(:department)
    
    exployeeA = FactoryBot.create(:employee, department: department, email: "ro@1.com")
    exployeeB = FactoryBot.create(:employee, department: department, email: "ro@2.com")

    expect(department.employees.count).to eq(2)
  end
end