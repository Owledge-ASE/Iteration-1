Feature: View Profile for Users


	As a note consumer
	I want to see the profile of a particular user

	Background: User is logged in
	Given the following users exist:
	 |id	|email 						|first_name     		|last_name 				|affiliation 			|organization					| password |
	 |1		|example1@gmail.com  		|Andrea       			|McCormick          	|Student                |Columbia University			| abcdef   |
	 |2		|example2@gmail.com  		|John       			|Smith          		|Student                |Columbia University			| password |
	 |3		|example3@gmail.com  		|Amy       				|Johnson          		|Student                |Princeton University			| safepass |
	 |4		|example4@gmail.com  		|Joseph       			|Doe          			|Student                |Harvard University				| s@fepass |
	 |5		|example5@gmail.com  		|Riley       			|Casey          		|Student                |Columbia University			| passw0rd |
	And the following notes exist:
	 |id | title                    |parent_id | description                                                                                                                                                                                       |
	 |1  | Sorting Algorithms       |          | In computer science, a sorting algorithm is an algorithm that puts elements of a list in a certain order.                                                                                         |
	And I am logged in as "example1@gmail.com"

	# https://stackoverflow.com/questions/39428665/actioncontrollerurlgenerationerror-in-registrationscontrollercreate
	Scenario: I should be able to see my profile from the home page
	When I am on the homepage
	And I follow "profile"
	Then I should be on my profile page

	Scenario: I should see a list of user fields on my profile page
	When I am on the profile page for "example1@gmail.com"
	Then I should see "Andrea" inside "#first_name"
	Then I should see "McCormick" inside "#last_name"
	Then I should see "example1@gmail.com" inside "#email"
	Then I should see "Student" inside "#affiliation"
	Then I should see "Columbia University" inside "#organization"

	Scenario: I should see a list of user fields on the profile page of another user
	When I am on the profile page for "example2@gmail.com"
	Then I should see "John" inside "#first_name"
	Then I should see "Smith" inside "#last_name"
	Then I should see "example2@gmail.com" inside "#email"
	Then I should see "Student" inside "#affiliation"
	Then I should see "Columbia University" inside "#organization"


	#When I am on the profile page for "example5@gmail.com"
	Scenario: get to a sub-note that does not exist (sad path)
		When I go to the profile page with ID 1010
		Then I should be on the homepage
		And I should see "Could not find a profile with ID 1010" inside "#error_message"

	Scenario: I try to access my profile page but I am not logged in (sad path)
		When I am on the homepage
		And I follow "Log out"
		And I go to my profile page
		Then I should be on the login page
		And I should see "Login required to view your profile." in "#error_message"
