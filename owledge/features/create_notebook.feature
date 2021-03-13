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
  When The user goes to the root page
  And The user clicks the "add notebook" button
  Then the user should see a "Title" textbox
  Then the user should see a "Description" textbox
  Then the user should see a "Add Child" button
  Then the user should see a "Finish" button

Scenario:If user tries to submit without entering anything in notebook title/info fields then an error message will appear (sad path)
  When The user goes to the root page
  And The user clicks the "add notebook" button
  And The user click the "Finish" button
  Then The user should see an error message "Kindly enter a title and description"

Scenario:If user tries to add a child without entering title and description an error message will appear (sad path)
  When The user goes to the root page
  And The user clicks the "add notebook" button
  And The user click the "Add Child" button
  Then The user should see an error message "Kindly enter a title and description"

Scenario: The user should be able to create a single note
  When The user goes to the root page
  And The user clicks the "add notebook" button
  And The user fills "Code Testing" as "title"
  And The user fills "Understanding the different paths and creating test cases to evaluate features" as "description"
  And The user clicks the "Finish" button
  Then The user should see be redirected to the "list_notebooks" page
  Then The user should see "Code Testing" in list of nodes

Scenario: The user should be able to create a node with multiple children
  When The user goes to the root page
  And The user clicks the "add notebook" button
  And The user fills "Bootstrap" as "title"
  And The user fills "Quickly design and customize responsive mobile-first sites with Bootstrap, the world’s most popular front-end open source toolkit" as "description"
  And The user clicks the "Add Child" button
  Then The user should be taken to the "create" page
  Then The user should see a breadcrumb link to "Bootstrap"
  And The user fills "Layout" as "title"
  And The user fills "Allow users tp add in a layout" as "description"
  And The user clicks the "Add Child" button
  Then The user should be taken to the "create" page
  Then The user should see a breadcrumb link to "Bootstrap"
  Then The user should see a breadcrumb link to "Layout"
  When The user clicks on the "Layout" breadcrumb
  Then The user should be taken to the "create" page
  Then The user sees title as "Layout"
  When The user clicks the "Add Child" button
  And The user fills "Breakpoints" as "title"
  And The user fills "Breakpoints are customizable widths that determine how your responsive layout behaves across device or viewport sizes in Bootstrap." as "description"
  When The user clicks the "Finish" button
  Then The user should be taken to the "create" page
  Then The user sees title as "Layout"
  When The user clicks the "Finish" button
  Then The user sees title as "Bootstrap"
  When The user clicks the "Finish" button
  Then The user should see be redirected to the "list_notebooks" page
  Then The user should see "Bootstrap" in list of nodes

Scenario: If user tries to submit without entering anything in node description field then an error message will appear (sad path)

Scenario: If a user fills out node description properly, then the list of nodes should refresh and the newly created node should appear  

Scenario: If a user clicks “Finish Creation for Notebook” then the user will be directed back to the home page where they should see the notebook on the home page  

Scenario: If the user clicks the Owledge logo, then redirect back to Home page   








