Feature: List Notebooks

  As a note consumer
  I want to see available notes

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
  | 10                       | For merge  |  Runs recursively | 8 |

Scenario:Once user navigates to Owledge then they should be on the homepage
  When the user goes to the "root" page
  Then the user should be shown the "list_notebook" page

Scenario:On the homepage there should be a list of notebooks
  When The user goes to the "root" page
  Then The user should see "Graph Theory" in list of nodes
  Then The user should see "Sorting Algorithms" in list of nodes
  Then The user should see "Analysis of Algorithms" in list of nodes
  Then The user should see "Distributed Computing" in list of nodes
  Then The user should see "Big Data" in list of nodes

Scenario:On the homepage there should be a add button
  When The user goes to the "root" page
  Then The user should be able to see an "add notebook" button

Scenario:If the user clicks on the add button then they can navigate to the add page (Create page)
  When The user goes to the "root" page
  And The user clicks the "add notebook" button
  Then The user should be taken to the "create" page

Scenario:If the user clicks on a notebook then they will be redirected to the details page 
  When The user goes to the "root" page
  And The user clicks on notebook of "Sorting Algorithms"
  Then The user should be taken to the details page of "Sorting Algorithms"






