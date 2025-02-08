class Employee < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :department
  before_validation :set_default_role, on: :create
  before_validation :generate_password_for_admin_created_employee, on: :create, if: :admin_creating_employee?

  validates :role, inclusion: { in: ["default", "admin"] }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :department, presence: true
  validates :yearly_salary, presence: true, numericality: { greater_than: 0 }
  def admin?
    role == 'admin'
  end

  def default?
    role == "default"
  end
  
  def set_default_role
    self.role ||= "default"
  end

  def generate_password_for_admin_created_employee
    self.password = Devise.friendly_token[0, 20] if password.blank?
  end

  def admin_creating_employee?
    new_record? && !password.present?
  end
end