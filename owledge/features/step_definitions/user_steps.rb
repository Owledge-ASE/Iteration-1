World(Devise::TestHelpers)

When /^(?:I am logged out|I am not logged in)$/ do
  unless current_user.nil?
    logout current_user
  end
end

When /^I am logged in as "([^"]+)"$/ do |email|
  login_as User.find_by_email(email)
end

Then /^I should be logged in(?: as ([^"]+))?$/ do |email|
  if email.nil?
    user_signed_in?
  end
  user_signed_in? && current_user.email == email
end