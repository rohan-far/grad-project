class Department < ApplicationRecord
    validates :name, presence: true

    has_many :employees
end
