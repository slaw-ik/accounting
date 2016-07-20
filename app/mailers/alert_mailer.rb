class AlertMailer < ActionMailer::Base

  def critical_count(user, account, count)
    @count = count
    @account = account
    mail(:to => user.email, :subject => "Critical count", :from => "innv.demoapp@gmail.com")
  end
end