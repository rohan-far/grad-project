class Employee < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :department
  before_validation :set_default_role, on: :create

  validates :role, inclusion: { in: ["default", "admin"] }, unless: -> { new_record? }
  validates :first_name, presence: true, unless: -> { new_record? }
  validates :last_name, presence: true, unless: -> { new_record? }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }, unless: -> { new_record? }
  validates :department, presence: true, unless: -> { new_record? }
  validates :yearly_salary, presence: true, numericality: { greater_than: 0 }, unless: -> { new_record? }
  def admin?
    role == 'admin'
  end

  def default?
    role == "default"
  end
  
  def set_default_role
    self.role ||= "default"
  end
end