class SendInvoicesJob < ApplicationJob
  queue_as :default
  retry_on StandardError, wait: 5.seconds, attempts: 3

  def perform
    Employee.find_each do |employee|
      
      monthly_salary = employee.yearly_salary / 12
      gst = monthly_salary * 0.1
      total_amount = monthly_salary + gst

      begin
      EmployeeMailer.invoice_email(employee, total_amount).deliver_now
      rescue StandardError => e
        raise e
      end
    end
  end
end
