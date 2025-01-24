class EmployeeMailer < ApplicationMailer
    default from: "no-reply@me.com"

    def invoice_email(employee, total_amount)
        @employee = employee
        @total_amount = total_amount
        
        mail(to: @employee.email, subject: "here is your invoice")
    end
end
