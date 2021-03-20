Feature: View Details page for Notes

  As a logged-in user
  I want to edit my profile

Background: User is logged in
  Given The following users exist:
    |id	| email 				| first_name     | last_name | affiliation | organization		  |
    |1	| example1@gmail.com  	| Andrea       	 | McCormick | Student     | Columbia University  |
    |5	| example5@gmail.com  	| Riley          | Casey     | Student     | Columbia University  |

  When I am on the homepage
  And I am logged in as "example1@gmail.com"

Scenario: User should be able to reach edit page from profile.
  When I am on my profile
  And I press "Edit Profile"
  Then I should be on my profile edit page

Scenario: User is on edit page and sees pre-filled values.
  When I am on my profile edit page
  Then the "first_name" field should contain "Andrea"
  And the "last_name" field should contain "McCormick"
  And the "affiliation" field should contain "Student"
  And the "organization" field should contain "Columbia University"

Scenario: User should be able to edit names.
  When I am on my profile edit page
  And I fill in "user[first_name]" with "Anne"
  And I fill in "user[last_name]" with "Smith"
  And I fill in "user[affiliation]" with "Faculty"
  And I fill in "user[organization]" with "Fake U"
  And I fill in "user[email]" with "annesmith@fakeu.edu"
  And I press "Save"
  Then I should be on my profile
  And I should see "Anne" in "#first_name"
  And I should see "Smith" in "#last_name"
  And I should see "annesmith@fakeu.edu" in "#email"
  And I should see "Faculty" in "#affiliation"
  And I should see "Fake U" in "#organization"

Scenario: User should see an error if profile is blank.
  When I am on my profile edit page
  And I fill in "user[email]" with ""
  And I press "Save"
  Then I should be on my profile edit page
  And I should see "Email is a required field" inside "#error_message"

Scenario: User should not be able to see edit button on non-profile page.
  When I am on the profile page of "example5@gmail.com"
  Then I should not see the "Edit" button