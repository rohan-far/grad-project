class Employee < ApplicationRecord

    belongs_to :department

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :department_id, presence: true
    validates :yearly_salary, presence: true, numericality: { greater_than: 0 }
end
