Given /^the following comments exist:$/ do |table|
  table.hashes.each do |user_comment|
    UserComment.create user_comment
  end
end

When /^(?:I )?should see a comment "([^"]+)"(?: by "([^"]+)")?$/ do |comment, author|
  if author.nil?
    expect(page).to have_css('#comments .comment', text: comment)
  else
    expect(page).to have_css(%{#comments user-comment[author="#{author}"] .comment}, exact_text: comment)
  end
end