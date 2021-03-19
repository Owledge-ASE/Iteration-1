Feature: Login for Users

	As a note consumer
	I want to login to my Owledge account

Scenario: I should be be able to submit a list of login fields on the login page
	When I am on the login page
	And I fill in "email" with "example1@gmail.com"
	And I fill in "password" with "1234"
	And I press "Login"
	Then I should be on the homepage 

Scenario: I should not be able to login with incorrect login fields on the login page
	When I am on the login page
	And I fill in "email" with "incorrect1@gmail.com"
	And I fill in "password" with "abcd"
	And I press "Login"
	Then I should see "Incorrect username or password. Try again!"

Scenario: I should be able to sign up from the login page
	When I am on the login page
	And I am a new user
	And I press "Sign Up"
	Then I should see label "email"
	Then I should see label "password"
	Then I should see label "confirm password"
	Then I should see label "first name"
	Then I should see label "last name"
	Then I should see label "affiliation"
	Then I should see label "organization"

Scenario: I should fill in the fields to sign up as a new user
	When I am on the sign up page
	And I fill in "email" with "example6@gmail.com"
	And I fill in "password" with "0000"
	And I fill in "confirm password" with "0000"
	And I fill in "first name" with "Madison"
	And I fill in "last name" with "Pack"
	And I fill in "affiliation" with "student"
	And I fill in "organization" with "Columbia University"
	And I press "Submit"
	Then I should see "Welcome to Owledge! Please check for a confirmation email before logging in"
	

Scenario: My profile should be updated with the login timestamp
	When I am on the login page
	And I fill in the correct login fields 
	And I press "Login"
	Then "last login" in my user profile should be updated with the current timestamp 