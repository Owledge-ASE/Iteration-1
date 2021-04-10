#And(/^I select "([^"]*)" inside "([^"]*)"$/) do |arg_option, arg_id|

#expect(page).to have_css(arg_id, text: arg_option) # include homepage
  #find(arg_id).find(:xpath, arg_option).select_option
  # find(arg_id).find_field(arg_option).select_option
#end

And /^I select "([^"]*)"(?: inside "([^"]+)")?$/ do |content, container|
  if container.nil?
    container = page
  end
  expect(container).to have_css('.dropdown-item', :text => content)
end
