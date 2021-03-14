Feature: List Notebooks

  As a note consumer
  I want to see available notes

Background: notes have been added to the database

  Given the following notes exist:
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
  When I go to the homepage
  Then I should be on the notebooks page

Scenario:On the homepage there should be a list of notebooks
  When I go to the homepage
  Then I should see "Graph Theory" within ".card-container"
  Then I should see "Sorting Algorithms" within list of nodes
  Then I should see "Analysis of Algorithms" within list of nodes
  Then I should see "Distributed Computing" within list of nodes
  Then I should see "Big Data" within list of nodes

Scenario:On the homepage there should be an add button
  When I go to the homepage
  Then I should see "Add Note"

Scenario: If I click on the add button then they can navigate to the add page (Create page)
  When I go to the homepage
  And I press "Add Note"
  Then I should be on the create page

Scenario:If I clicks on a notebook then they will be redirected to the details page 
  When I go to the homepage
  And I follow "note_1"
  Then I should be on the details page of "Sorting Algorithms"


Scenario: click on Owledge logo
  When I go to the homepage
  When I follow "owledge_logo"
  Then I should be on the homepage

