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

Scenario:If a user is on the Details page then they will see the notebook title, notebook summary, and list of nodes for a given notebook
  When The user goes to the "root" page
  And The user clicks on notebook of "Sorting Algorithms"
  Then the user should see the title for "Sorting Algorithms"
  Then the user should see the summary for "Sorting Algorithms"
  Then the user should see the list of nodes for "Sorting Algorithms"

Scenario:If a user clicks on a specific node then they should be able to see the information for that specific node 
  When The user goes to the "root" page
  And The user clicks on notebook of "Sorting Algorithms"
  Then The user should see the title as "Sorting Algorithms"
  Then The user should see the description as "In computer science, a sorting algorithm is an algorithm that puts elements of a list in a certain order."
  Then The user should see "Bubble Sort" in list of nodes
  Then The user should see "Sorting Algorithms Child" in list of nodes
  Then The user should see "Merge Sort" in list of nodes

Scenario:If a user clicks on a node on the details page then they should be directed to its details page
  When The user goes to the "root" page
  And The user clicks on notebook of "Sorting Algorithms"
  And The user clicks on notebook of "Merge Sort"
  Then The user should see the title as "Merge Sort"
  Then The user should see the description as "Merges sorted arrays"
  Then The user should see "Bubble Sort" in list of nodes
  Then The user should see "Recursive merge" in list of nodes
  Then The user should see "For merge" in list of nodes

Scenario:If the user clicks the Owledge logo, then redirect back to Home page
  When The user clicks on the Owledge logo
  Then the user should redirect to the "list_notebook" page








