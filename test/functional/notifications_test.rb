require 'test_helper'

class NotificationsTest < ActionMailer::TestCase
  test "beta_invite" do
    mail = Notifications.beta_invite
    assert_equal "Beta invite", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
