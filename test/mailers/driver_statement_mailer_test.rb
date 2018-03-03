require 'test_helper'

class DriverStatementMailerTest < ActionMailer::TestCase
  test "statement" do
    mail = DriverStatementMailer.statement
    assert_equal "Statement", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
