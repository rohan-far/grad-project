class Employee < ApplicationRecord

  before_validation :set_defaults, on: :create

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    belongs_to :department

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :department, presence: true
    validates :yearly_salary, presence: true, numericality: { greater_than: 0 }

    private

    def set_defaults
      self.yearly_salary ||= 1.0
      self.first_name ||= "New"
      self.last_name ||= "Employee"
      self.yearly_salary ||= 0.0
      self.department ||= Department.first
    end
end
