class SendInvoicesJob < ApplicationJob
  queue_as :default

  def perform
    Employee.find_each do |employee|
      monthly_salary = employee.yearly_salary / 12
      gst = monthly_salary * 0.1
      total_amount = monthly_salary + gst

      EmployeeMailer.invoice_email(employee, total_amount).deliver_now
    end
  end
end
