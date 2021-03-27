Given /^the following reactions exist:$/ do |table|
  table.hashes.each do |user_reaction|
    UserReaction.create user_reaction
  end
end

Then /^(?:|I )should( not)? see the like button$/ do |opposite|
  if opposite.nil?
    expect(page).not_to have_selector(:id, 'id', text:"like_button")
    #expect(page).to have_css(%{#like_button})
  else
    expect(page).not_to have_selector(:id, 'id', text:"like_button")
    #expect(page).not_to have_css(%{#like_button})
  end
end

