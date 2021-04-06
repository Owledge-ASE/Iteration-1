And(/^I select "([^"]*)" inside "([^"]*)"$/) do |arg_option, arg_id|

  expect(page).to have_css(arg_id, text: arg_option) # include homepage
  #find(arg_id).find(:xpath, arg_option).select_option
  # find(arg_id).find_field(arg_option).select_option
end