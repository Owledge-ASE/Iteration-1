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
  And I should not see "Register" in "#login_section"

  Then I should be on the homepage
  And I should see "Welcome to Owledge!" in "#success_message"

  When I go to edit my profile
  Then the "user[first_name]" field should contain "Anne"
  And the "user[last_name]" field should contain "Smith"
  And the "user[email]" field should contain "annesmith@fakeu.edu"
  And the "user[affiliation]" field should contain "Faculty"
  And the "user[organization]" field should contain "Fake U"

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
