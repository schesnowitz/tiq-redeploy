class DriverStatementMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.driver_statement_mailer.statement.subject
  #
  def statement(driver_statement)
    @driver_statement = driver_statement
    @loads = @driver_statement.loads
    attachments['statement.pdf'] =  WickedPdf.new.pdf_from_string(
      render_to_string(
      template: 'driver_statements/statement_template.pdf.erb',  
      layout: 'layouts/application.pdf.erb'))   

      mail(to: @driver_statement.driver_user.email,
      cc: "steve@chesnowitz.com",
      subject: "Statement for #{@driver_statement.driver_user.full_name}") 
  end
end
