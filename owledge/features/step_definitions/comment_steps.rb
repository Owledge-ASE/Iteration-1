Given /^the following comments exist:$/ do |table|
  table.hashes.each do |user_comment|
    UserComment.create user_comment
  end
end

When /^(?:I )?should see a comment "([^"]+)"(?: by "([^"]+)")?$/ do |comment, author|
  if author.nil?
    expect(page).to have_css('#comments', text: comment)
  else
    expect(page).to have_css(%{#comments user-comment[author="#{author}"]}, exact_text: comment)
  end
end

When /^I press "([^"]+)" and accept the warning$/ do |button|
  accept_alert do
    step %{I press "#{button}"}
  end
end