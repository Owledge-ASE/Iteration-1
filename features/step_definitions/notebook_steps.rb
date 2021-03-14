# And I should see 1 breadcrumb

# Sean
# And I should see 2 breadcrumbs
# And I should see a breadcrumb link to "Sorting Algorithms"
# But "#children" should not exist

# George
# Then I should see the label "Description"
# Then I should see the "Save" button

# George
Given /the following notes exist/ do | notes_table |
    notes_table.hashes.each do |note|
      SubNote.create note
    end
    
end

Then /^(?:|I )should see the label "([^"]*)"$/ do |labelname| 

    if page.respond_to? :should
        page.should have_content(labelname)
      else
        assert page.has_content?(labelname)
      end
end

Then /^(?:|I )should see the "([^"]*)" button$/ do |buttonname| 

    if page.respond_to? :should
        page.should have_content(buttonname)
      else
        assert page.has_content?(buttonname)
      end
end




# Sean
Then /I should see ([0-9]+) breadcrumbs/ do | n_breadcrimbs |

end

