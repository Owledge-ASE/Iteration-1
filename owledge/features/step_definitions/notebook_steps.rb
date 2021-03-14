# And I should see 1 breadcrumb

# Sean
# And I should see 2 breadcrumbs
# And I should see a breadcrumb link to "Sorting Algorithms"
# But "#children" should not exist

# George
# Then I should see the label "Description"
# Then I should see the "Save" button

require 'pry'

# George
Given /the following (sub)?notes exist/ do | notes_table |

end

Then /I should see the label "(.+)"/ do | label |

end

Then /I should see the "(.+)" button/ do | label |

end



# Sean
Then /I should see ([0-9]+) breadcrumbs?/ do | n_breadcrimbs |
  binding.pry
  page.find('#breadcrumb')
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