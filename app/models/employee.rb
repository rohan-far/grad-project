class Employee < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    belongs_to :department

    enum role: { default: "default", admin: "admin" }, _prefix: true
    
    validates :role, inclusion: { in: roles.keys } 
    validates :first_name, presence: true, unless: -> { new_record }
    validates :last_name, presence: true, unless: -> { new_record }
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }, unless: -> { new_record }
    validates :department, presence: true, unless: -> { new_record }
    validates :yearly_salary, presence: true, numericality: { greater_than: 0 }, unless: -> { new_record }
end
