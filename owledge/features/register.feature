Feature: View Details page for Notes

  As a logged-in user
  I want to edit my profile

Background: User is not logged in
  When I am on the homepage
  And I am not logged in

Scenario: User should be able to reach the registration page.
  When I follow "Register"
  Then I should be on the registration page

Scenario: User registers, should be logged in, and password works.
  When I am on the registration page
  And I fill in "first_name" with "Anne"
  And I fill in "last_name" with "Smith"
  And I fill in "affiliation" with "Faculty"
  And I fill in "organization" with "Fake U"
  And I fill in "email" with "annesmith@fakeu.edu"
  And I fill in "password" with "password"
  And I fill in "password_confirm" with "password"
  And I press "Save"

  Then I should be on my profile
  And I should see "Anne" in "#first_name"
  And I should see "Smith" in "#last_name"
  And I should see "annesmith@fakeu.edu" in "#email"
  And I should see "Faculty" in "#affiliation"
  And I should see "Fake U" in "#organization"
  And I should see "Welcome to Owledge!" inside "#success_message"
  And I should not see "Register" inside "#header"

  When I am logged out
  And I am on the login page
  And I fill in "email" with "annesmith@fakeu.edu"
  And I fill in "password" with "password"
  And I press "Log In"
  Then I should be logged in

Scenario: User tries to register, gives wrong password.
  When I am on the registration page
  And I fill in "first_name" with "Anne"
  And I fill in "last_name" with "Smith"
  And I fill in "affiliation" with "Faculty"
  And I fill in "organization" with "Fake U"
  And I fill in "email" with "annesmith@fakeu.edu"
  And I fill in "password" with "password"
  And I fill in "password_confirm" with "something"
  And I press "Save"
  Then I should be on the registration page
  And I should see "Passwords don't match" inside "#error_message"
