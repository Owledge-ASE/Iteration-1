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
  When I go to the root page
  And I press "Add Note"
  Then I should see the label "Title"
  Then I should see the label "Description"
  Then I should see the "Save" button

Scenario:If user tries to submit without entering anything in notebook title/info fields then an error message will appear (sad path)
  When I go to the root page
  And I press "Add Note"
  And I press "Save"
  Then I should "Kindly enter a title and description" in "#error_message"

Scenario: I should be able to create a single note
  When I go to the homepage
  And I press "Add Note"
  And I fill in "title" with "Code Testing" 
  And I fill in "description" with "Understanding the different paths and creating test cases to evaluate features"
  And I press "Save"
  Then I should be on the details page for "Code Testing"

  When I press "Back to Notes"
  Then I should be on the homepage
  And I should see "Code Testing" in list of nodes

Scenario: I should be able to create a node with multiple children
  When I go to the homepage
  And I press "Add Note"
  Then I should be on the create page

  When I fill in "title" with "Bootstrap"
  And I fill in "description" with "Quickly design and customize responsive mobile-first sites with Bootstrap, the world’s most popular front-end open source toolkit" 
  And I press "Save"
  Then I should be on the details page for "Bootstrap"

  When I press "Add Child"
  Then I should be on the create page
  And I should see a breadcrumb link to "Bootstrap"
  When I fill in "title" with "Layout" 
  And I fill in "description" with "Allow users to add in a layout"
  And I press "Save"
  Then I should be on the details page for "Layout"
  And I should see 2 breadcrumbs
  And I should see a breadcrumb link to "Bootstrap"
  And I should see "Layout" in "#title"

Scenario: If I clicks the Owledge logo, then redirect back to Home page    
    When I follow "owledge_logo"
    Then I should be on the homepage








