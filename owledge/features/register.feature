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
  And I fill in "user[first_name]" with "Anne"
  And I fill in "user[last_name]" with "Smith"
  And I fill in "user[affiliation]" with "Faculty"
  And I fill in "user[organization]" with "Fake U"
  And I fill in "user[email]" with "annesmith@fakeu.edu"
  And I fill in "user[password]" with "password"
  And I fill in "user[password_confirmation]" with "password"
  And I press "Sign up"

  Then I should be on the homepage
  And I should see "Welcome to Owledge!" in "#success_message"

  When I go to edit my profile
  Then I should see "Anne" in "#user_first_name"
  And I should see "Smith" in "#user_last_name"
  And I should see "annesmith@fakeu.edu" in "#user_email"
  And I should see "Faculty" in "#user_affiliation"
  And I should see "Fake U" in "#user_organization"
  And I should not see "Register" in "#login_section"

Scenario: User tries to register, gives wrong password.
  When I am on the registration page
  And I fill in "user[first_name]" with "Anne"
  And I fill in "user[last_name]" with "Smith"
  And I fill in "user[affiliation]" with "Faculty"
  And I fill in "user[organization]" with "Fake U"
  And I fill in "user[email]" with "annesmith@fakeu.edu"
  And I fill in "user[password]" with "password"
  And I fill in "user[password_confirmation]" with "something"
  And I press "Sign up"
  Then I should be on the registration page
  And I should see "Password confirmation doesn't match Password" in "#error_explanation"
