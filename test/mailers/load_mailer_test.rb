require 'test_helper'

class LoadMailerTest < ActionMailer::TestCase
  test "active_load" do
    mail = LoadMailer.active_load
    assert_equal "Active load", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
