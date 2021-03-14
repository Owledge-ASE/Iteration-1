Feature: View Details page for Notes

  As a note consumer
  I want to see the details of a particular note and its children

Scenario: User should be able to get to the create page from the home page
  When I am on the homepage
  And I follow "Add Note"
  Then I should be on the create page

Scenario:User should be able to be able to see fields for title and description
  When I am on the create page
  Then I should see the label "Title"
  Then I should see the label "Description"
  Then I should see the "Save Note" button

Scenario:If user tries to submit without entering anything in notebook title/info fields then an error message will appear (sad path)
  When I am on the create page
  And I press "Save Note"
  Then I should see "Kindly enter a title and description" inside "#error_message"

Scenario: I should be able to create a single note
  When I am on the create page
  And I fill in "note_title" with "Code Testing"
  And I fill in "note_description" with "Understanding the different paths and creating test cases to evaluate features"
  And I press "Save Note"
  Then I should be on the details page for "Code Testing"

  When I follow "Home"
  Then I should be on the homepage
  And I should see "Code Testing" inside list of nodes

Scenario: I should be able to create a node with multiple children
  When I am on the create page
  When I fill in "note_title" with "Bootstrap"
  And I fill in "note_description" with "Quickly design and customize responsive mobile-first sites with Bootstrap, the world’s most popular front-end open source toolkit"
  And I press "Save Note"
  Then I should be on the details page for "Bootstrap"

  When I follow "Add Note"
  Then I should be on the create page
  And I should see a breadcrumb link to "Bootstrap"
  When I fill in "note_title" with "Layout"
  And I fill in "note_description" with "Allow users to add in a layout"
  And I press "Save Note"
  Then I should be on the details page for "Layout"
  And I should see 2 breadcrumbs
  And I should see a breadcrumb link to "Bootstrap"
  And I should see "Layout" inside "#title"

Scenario: If I clicks the Owledge logo, then redirect back to Home page   
    When I am on the create page
    When I follow "owledge_logo"
    Then I should be on the homepage







