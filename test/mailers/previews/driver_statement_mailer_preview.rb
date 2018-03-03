# Preview all emails at http://localhost:3000/rails/mailers/driver_statement_mailer
class DriverStatementMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/driver_statement_mailer/statement
  def statement
    driver_statement = DriverStatement.last
    DriverStatementMailer.statement(driver_statement)
  end

end
