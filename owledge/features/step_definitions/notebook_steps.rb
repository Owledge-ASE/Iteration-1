# And I should see 1 breadcrumb

# Sean
# And I should see 2 breadcrumbs
# And I should see a breadcrumb link to "Sorting Algorithms"
# But "#children" should not exist

# George
# Then I should see the label "Description"
# Then I should see the "Save" button

require 'pry'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))



Then /^I should see "(.*)" inside (.*[^:])$/ do |content, parent|
end

# George
Given /the following notes exist/ do | notes_table |
    notes_table.hashes.each do |note|
      Note.create note
    end
    
end

Then /^(?:|I )should see the label "(.+)"$/ do |labelname| 
    if page.respond_to? :should
        page.should have_content(labelname)
    else
      assert page.has_content?(labelname)
    end
end

Then /^(?:|I )should see the "(.+)" button$/ do |buttonname|
  has_css?(%Q{input[value="#{buttonname}"]})
end

Then /^I should see "(.+)" in list of nodes$/ do | needle |

end


# Sean
Then /^I should see ([0-9]+) breadcrumb(?:s?)$/ do | n_breadcrumbs |
  page.all('#breadcrumbs a').size == Integer(n_breadcrumbs) + 1 # include homepage
end

Then /^I should see a breadcrumb link to "(.+)"$/ do | link |
  page.find('#breadcrumbs').has_link?(link)
end

Then /^"(.+)" should not exist$/ do | id |
  has_css?(id)
end

Then /^I should see "([^"]+)" in "([^"]+)"$/ do | needle, haystack |
  find(haystack).has_text?(needle)
end

Then /^I should not see "([^"]+)" in "([^"]+)"$/ do | needle, haystack |
  !step %Q{I should see "#{needle}" in "#{haystack}"}
end

# Andrea
Given /the following users exist:/ do | users_table |
  users_table.hashes.each do |user|
    User.create user
  end

end

#Andrea
#When /^I am logged in as "([^"]+)"/ do | user_email |
#  @user = User.new(:email => email)
#  @user.save!
# basic_authorize(:email => email)
#end

When /^I am logged in as "([^"]+)"/ do | email |
  encoded_login = ["#{email}"].pack("m*")
  page.driver.header 'Authorization', "Basic #{encoded_login}"
end

