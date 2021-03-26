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

Then /^(?:|I )should( not)? see the "(.+)" button$/ do |opposite, buttonname|
  if opposite.nil?
    expect(page).to have_css(%{input[value="#{buttonname}"]})
  else
    expect(page).not_to have_css(%{input[value="#{buttonname}"]})
  end
end

Then /^I should( not)? see "(.+)" before "(.+)" in "(.+)"$/ do | opposite,first,second,container |
  step %{I should see "#{first}" inside "#{container}"}
  step %{I should see "#{second}" inside "#{container}"}
  if opposite.nil?
    page.body.index(first).should < page.body.index(second)
  else
    page.body.index(first).should >= page.body.index(second)
  end

end

Then /^I should( not)? see "(.+)" before "(.+)" in the note grid$/ do | opposite,first,second |
  step %{I should see "#{first}" inside "#note-grid"}
  step %{I should see "#{second}" inside "#note-grid"}
  if opposite.nil?
    page.body.index(first).should < page.body.index(second)
  else
    page.body.index(first).should >= page.body.index(second)
  end

end

Then /^I should see "(.+)" in(?:side)? list of nodes$/ do | needle |
  step %{I should see "#{needle}" inside "#notes"}
end


# Sean
Then /^I should see ([0-9]+) breadcrumb(?:s?)$/ do | n_breadcrumbs |
  expect(page).to have_css('#breadcrumbs a', count: Integer(n_breadcrumbs) + 1) # include homepage
end

Then /^I should see a breadcrumb link to "(.+)"$/ do | link |
  expect(page).to have_css('#breadcrumbs a', text: link)
end

Then /^"(.+)" should not exist$/ do | id |
  expect(page).not_to have_css(id)
end

Then /^I should( not)? see "([^"]+)" in(?:side)? "([^"]+)"$/ do | opp, needle, haystack |
  if opp.nil?
    expect(find(haystack)).to have_text(needle)
  else
    expect(find(haystack)).not_to have_text(needle)
  end
end

Then /^debug$/ do
  binding.pry
end

# Andrea


#Andrea
#When /^I am logged in as "([^"]+)"/ do | user_email |
#  @user = User.new(:email => email)
#  @user.save!
# basic_authorize(:email => email)
#end

#When /^I am logged in as "([^"]+)"/ do | email |
#encoded_login = ["#{email}"].pack("m*")
#page.driver.header 'Authorization', "Basic #{encoded_login}"
#end

