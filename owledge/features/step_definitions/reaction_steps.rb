Given /^the following reactions exist:$/ do |table|
  table.hashes.each do |user_reaction|
    UserReaction.create user_reaction
  end
end

Then(/^I should see "([^"]*)" inside "([^"]*)" count for this note$/) do |num_likes|
    expect(page).to have_css(%{#reactions @note.user_reactions.count="#{num_likes}"]}, exact_text: num_likes
end

Then (/^And I should see the "([^"]*)" button$/) do |arg|
  expect(page).to have_css(%{#{arg}})
end
