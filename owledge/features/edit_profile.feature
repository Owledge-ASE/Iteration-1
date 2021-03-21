Feature: View Details page for Notes

  As a logged-in user
  I want to edit my profile

Background: User is logged in
  Given the following users exist:
    |id	| email 				| first_name     | last_name | affiliation | organization		  | password |
    |1	| example1@gmail.com  	| Andrea       	 | McCormick | Student     | Columbia University  | abcdef   |
    |5	| example5@gmail.com  	| Riley          | Casey     | Student     | Columbia University  | goodpass |

  When I am on the homepage
  And I am logged in as "example1@gmail.com"

Scenario: User should be able to reach edit page from profile.
  When I am on my profile page
  And I follow "edit_profile"
  Then I should be on edit my profile

Scenario: User is on edit page and sees pre-filled values.
  When I am on edit my profile
  Then the "user_first_name" field should contain "Andrea"
  And the "user_last_name" field should contain "McCormick"
  And the "user_affiliation" field should contain "Student"
  And the "user_organization" field should contain "Columbia University"

Scenario: User should be able to edit names.
  When I am on edit my profile
  And I fill in "user[first_name]" with "Anne"
  And I fill in "user[last_name]" with "Smith"
  And I fill in "user[affiliation]" with "Faculty"
  And I fill in "user[organization]" with "Fake U"
  And I fill in "user[email]" with "annesmith@fakeu.edu"
  And I fill in "user[current_password]" with "abcdef"
  And I press "Update"
  Then I should be on the homepage

  When I go to my profile page
  And I should see "Anne" in "#first_name"
  And I should see "Smith" in "#last_name"
  And I should see "annesmith@fakeu.edu" in "#email"
  And I should see "Faculty" in "#affiliation"
  And I should see "Fake U" in "#organization"

Scenario: User should see an error if profile is blank.
  When I am on edit my profile
  And I fill in "user[email]" with ""
  And I press "Update"
  Then I should be on edit my profile
  And I should see "Email can't be blank" in "#error_explanation"

Scenario: User should have to enter password to change
  When I am on edit my profile
  And I fill in "user[first_name]" with "Anna"
  And I press "Update"
  Then I should be on edit my profile
  And I should see "Current password can't be blank" in "#error_explanation"

Scenario: User should not be able to see edit button on non-profile page.
  When I am on the profile page for "example5@gmail.com"
  Then I should not see the "Edit" button