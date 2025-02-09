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

=begin

  having issue when admin try to create new employee it shows "You are already signed in" it's happening because RegistrationsController#create only 
  allows self-registration, meaning logged-in users (admins) cannot create employees using Devise's default flow. Devise’s RegistrationsController 
  includes a before_action :require_no_authentication, which prevents signed-in users from signing up another user. So I added custom 
  controller to override devise native behaviour. Now admin can create new employee however I see another issue. And that is when employee try to self register
  after click sign_up button, next page comes is the login page again.
=end