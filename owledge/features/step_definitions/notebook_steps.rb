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
    within(selector_for(parent)) do
        assert(has_content?(content))
    end     
end

# George
Given /the following notes exist/ do | notes_table |
    notes_table.hashes.each do |note|
      SubNote.create note
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

    if page.respond_to? :should
        page.should have_content(buttonname)
      else
        assert page.has_content?(buttonname)
      end
end

Then /^I should see "(.+)" in list of nodes$/ do | needle |

end


# Sean
Then /I should see ([0-9]+) breadcrumbs?/ do | n_breadcrumbs |
  page.find('#breadcrumb').all.count == n_breadcrumbs
end

Then /I should see a breadcrumb link to "(.+)"$/ do | link |
  find('#breadcumbs').has_link?(link)
end

Then /^"(.+)" should not exist$/ do | id |
  find(id).must_be_nil
end

Then /^I should see "(.+)" in "(.+)$/ do | needle, haystack |
  find(haystack).find(text: needle)
end

Then /^I should not see "(.+)" in "(.+)"$/ do | needle, haystack |
  find(haystack).find(text: needle).must_be_nil
end


