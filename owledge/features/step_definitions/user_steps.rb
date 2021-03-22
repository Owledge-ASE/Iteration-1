World(Devise::TestHelpers)

Given /the following users exist:/ do | users_table |
  users_table.hashes.each do |user|
    User.create(user).encrypted_password
  end

end

#When /^I am on the "([^"]+)" page of ([^@]+@[^"])/ do |page_name, email |
#visit path_to(page_name)
#page.should have_content('//[@email=$2]//')
#end

When /^(?:I am logged out|I am not logged in)$/ do
  unless current_user.nil?
    logout current_user
  end
end

When /^I am logged in as "([^"]+)"$/ do |email|
  login email
end

Then /^I should be logged in(?: as ([^"]+))?$/ do |email|
  if email.nil?
    assert user_signed_in?
  end
  expect(user_signed_in? && current_user.email).to eq(email)
end

When /^I follow the link "([^"]+)"$/ do |arg|
  find(%{#{arg}}).click
end