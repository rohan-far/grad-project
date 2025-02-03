FactoryBot.define do
  factory :employee do
    first_name { "Rohan" }
    last_name { "Fars" }
    email { "rohan.fars@example.com" }
    yearly_salary { 50000 }
    password {"123456"}
    password_confirmation {"123456"}

    association :department
  end
end
