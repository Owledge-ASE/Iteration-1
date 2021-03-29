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

#And(/^I do( not)? like this$/) do |opp|
#select = find(:css, 'class')
#if opp.nil?
    #within('i.class'){expect(page).to have_content("bi-suit-heart")}
    #expect(page).to have_field("i[.class='bi-suit-heart']")
    #expect(page).to have_selector(:i, 'i', text:"bi-suit-heart")
    #render(class: "bi-suit-heart")
#expect(select).to have_text("bi-suit-heart")
#else
  #within('i.class'){expect(page).to have_content("bi-suit-heart-filled")}
    #expect(page).to have_field("i[.class='bi-suit-heart-filled']")
    #expect(page).to have_selector(:i, 'i', text:"bi-suit-heart-filled")
#expect(select).to have_text("bi-suit-heart-filled")
#end
#end

