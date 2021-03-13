Feature: View Details page for Notes

  As a note consumer
  I want to see the details of a particular note and its children

Background: notes have been added to the database

  Given the following subnotes exist:
  | subnote_id             | title                   |  description | parent_id |
  | 1                       | Sorting Algorithms      |  In computer science, a sorting algorithm is an algorithm that puts elements of a list in a certain order. | |
  | 2                       | Graph Theory            |  In mathematics, graph theory is the study of graphs, which are mathematical structures used to model pairwise relations between objects. | |
  | 3                       | Analysis of Algorithms  |  In computer science, the analysis of algorithms is the process of finding the computational complexity of algorithms | |
  | 4                       | Distributed Computing   |  A distributed system is a system whose components are located on different networked computers, which communicate and coordinate their actions by passing messages to one another from any system | |
  | 5                       | Big Data                |  Big data is a field that treats ways to analyze, systematically extract information from, or otherwise deal with data sets that are too large | |
  | 6                       | Sorting Algorithms Child     |  test | 1 |
  | 7                       | Bubble Sort            |  Compares adjacent elements and moves them | 1 |
  | 8                       | Merge Sort  |  Merges sorted arrays | 1 |
  | 9                       | Recursive merge  |  Runs recursively | 8 |
  | 10                      | For merge  |  Runs recursively | 8 |

Scenario:User should be able to be able to see fields for title and description
  When I goes to the root page
  And I clicks the "add notebook" button
  Then I should see a "Title" textbox
  Then I should see a "Description" textbox
  Then I should see a "Add Child" button
  Then I should see a "Finish" button

Scenario:If user tries to submit without entering anything in notebook title/info fields then an error message will appear (sad path)
  When I go to the root page
  And I click the "add notebook" button
  And I click the "Finish" button
  Then I should see an error message "Kindly enter a title and description"

Scenario:If user tries to add a child without entering title and description an error message will appear (sad path)
  When I go to the root page
  And I clicks the "add notebook" button
  And I click the "Add Child" button
  Then I should see an error message "Kindly enter a title and description"

Scenario: I should be able to create a single note
  When I go to the root page
  And I click the "add notebook" button
  And I fill in "#title" with "Code Testing" 
  And I fill in "Understanding the different paths and creating test cases to evaluate features" as "#description"
  And I click the "Finish" button
  Then I should see be redirected to the "list_notebooks" page
  Then I should see "Code Testing" in list of nodes

Scenario: I should be able to create a node with multiple children
  When I goes to the root page
  And I clicks the "add notebook" button
  And I fill in "title" with "Bootstrap" 
  And I fill in "description" with "Quickly design and customize responsive mobile-first sites with Bootstrap, the world’s most popular front-end open source toolkit" 
  And I clicks the "Add Child" button
  Then I should be taken to the "create" page
  Then I should see a breadcrumb link to "Bootstrap"
  When I fill in "title" with "Layout" 
  And I fill in "description" with "Allow users tp add in a layout"
  And I click the "Add Child" button
  Then I should be taken to the "create" page
  Then I should see a breadcrumb link to "Bootstrap"
  Then I should see a breadcrumb link to "Layout"
  When I click on the "Layout" breadcrumb
  Then I should be taken to the "create" page
  Then I sees "#title" as "Layout"
  When I click the "Add Child" button
  And I fill in "#title" with "Breakpoints" 
  And I fill in "#description" with "Breakpoints are customizable widths that determine how your responsive layout behaves across device or viewport sizes in Bootstrap."
  When I clicks the "Finish" button
  Then I should be taken to the "create" page
  Then I sees "#title" as "Layout"
  When I clicks the "Finish" button
  Then I sees "#title" as "Bootstrap"
  When I clicks the "Finish" button
  Then I should see be redirected to the "list_notebooks" page
  Then I should see "Bootstrap" in list of nodes

Scenario: If I clicks the Owledge logo, then redirect back to Home page    
    When I click on the logo
    Then I should be on the homepage








