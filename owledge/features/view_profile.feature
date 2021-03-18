Feature: View Profile for Users


	As a note consumer
	I want to see the profile of a particular user

	Given the following users exist:
	 |id	|email 						|first_name     		|last_name 				|affiliation 			|organization					|    

	 |1		|example1@gmail.com  		|Andrea       			|McCormick          	|Student                |Columbia University			|
	 |2		|example2@gmail.com  		|John       			|Smith          		|Student                |Columbia University			|
	 |3		|example3@gmail.com  		|Amy       				|Johnson          		|Student                |Princeton University			|
	 |4		|example4@gmail.com  		|Joseph       			|Doe          			|Student                |Harvard University				|
	 |5		|example5@gmail.com  		|Riley       			|Casey          		|Student                |Columbia University			|

	Scenario: I should be able to see my profile from the home page
	When I am on the homepage
	And I follow "Profile"
	Then I should be on my profile page	

	Scenario: I should see a list of user fields on my profile page 
	When I am on my profile page
	Then I should see "Andrea" in "#first_name"
	Then I should see "McCormick" in "#last_name"
	Then I should see "example1@gmail.com" in "#email"
	Then I should see "Student" in "#affiliation"
	Then I should see "Columbia University" in "#organization"

	Scenario: I should be able to view the profile page of another user
	When I am on the notebook page for a given notebook
	And I press "View Profile"
	Then I should be on the profile page of the user who published the given note

	Scenario: I should see a list of user fields on the profile page of another user
	When I am on the profile page of another user
	Then I should see "John" in "#first_name"
	Then I should see "Smith" in "#last_name"
	Then I should see "example2@gmail.com" in "#email"
	Then I should see "Student" in "#affiliation"
	Then I should see "Columbia University" in "#organization"