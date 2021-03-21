Feature: View Profile for Users


	As a note consumer
	I want to see the profile of a particular user

	Background: User is logged in
	Given the following users exist:
	 |id	|email 						|first_name     		|last_name 				|affiliation 			|organization					|
	 |1		|example1@gmail.com  		|Andrea       			|McCormick          	|Student                |Columbia University			|
	 |2		|example2@gmail.com  		|John       			|Smith          		|Student                |Columbia University			|
	 |3		|example3@gmail.com  		|Amy       				|Johnson          		|Student                |Princeton University			|
	 |4		|example4@gmail.com  		|Joseph       			|Doe          			|Student                |Harvard University				|
	 |5		|example5@gmail.com  		|Riley       			|Casey          		|Student                |Columbia University			|

	# We have to authenticate like this in tests.
	# https://stackoverflow.com/questions/10735923/testing-http-basic-authentication-with-cucumber-and-rspec-in-rails-3-2-3
		# Implemented with:
		# https://stackoverflow.com/questions/7473477/http-basic-authentication-testing-in-cucumber
	And I am logged in as "example1@gmail.com"

	# https://stackoverflow.com/questions/39428665/actioncontrollerurlgenerationerror-in-registrationscontrollercreate
	Scenario: I should be able to see my profile from the home page
	When I am on the homepage
	And I follow "profile"
	Then I should be on the profile page of "example1@gmail.com"

	Scenario: I should see a list of user fields on my profile page
	When I am on the profile page for "example1@gmail.com"
	Then I should see "Andrea" inside "#first_name"
	Then I should see "McCormick" inside "#last_name"
	Then I should see "example1@gmail.com" inside "#email"
	Then I should see "Student" inside "#affiliation"
	Then I should see "Columbia University" inside "#organization"

	Scenario: I should be able to view the profile page of another user
	When I go to the notebook page for "Sorting Algorithms"
	And I press "View Profile"
	Then I should be on the profile page of the user who published the given note

	Scenario: I should see a list of user fields on the profile page of another user
	When I am on the profile page
	Then I should see "John" inside "#first_name"
	Then I should see "Smith" inside "#last_name"
	Then I should see "example2@gmail.com" inside "#email"
	Then I should see "Student" inside "#affiliation"
	Then I should see "Columbia University" inside "#organization"


	#When I am on the profile page for "example5@gmail.com"