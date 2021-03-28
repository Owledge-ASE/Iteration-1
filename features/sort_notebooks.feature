Feature: List Notebooks

  As a note consumer
  I want to see available notes

Background: notes have been added to the database

 Given the following notes exist:
 |id | title                    |parent_id | description                                                                                                                                                                                       |
 |1  | Sorting Algorithms       |          | In computer science, a sorting algorithm is an algorithm that puts elements of a list in a certain order.                                                                                         |
 |2  | Graph Theory             |          | In mathematics, graph theory is the study of graphs, which are mathematical structures used to model pairwise relations between objects.                                                          |
 |3  | Analysis of Algorithms   |          | In computer science, the analysis of algorithms is the process of finding the computational complexity of algorithms.                                                                             |
 |4  | Distributed Computing    |          | A distributed system is a system whose components are located on different networked computers, which communicate and coordinate their actions by passing messages to one another from any system |
 |5  | Big Data                 |          | Big data is a field that treats ways to analyze, systematically extract information from, or otherwise deal with data sets that are too large.                                                    |
 |6  | Sorting Algorithms Child | 1         | test                                                                                                                                                                                              |
 |7  | Bubble Sort              | 1        | Compares adjacent elements and moves them                                                                                                                                                         |
 |8  | Merge Sort               | 1        | Merges sorted arrays                                                                                                                                                                              |
 |9  | Recursive merge          | 8        | Runs recursively                                                                                                                                                                                  |
 |10 | For merge                | 8        | Runs recursively                                                                                                                                                                                  |

Scenario: Once user clicks on the sort button they should be on the Sorting page
  When I go to the homepage
  And I follow "sort_button"
  Then I should be on the notebooks sort page


Scenario: The user should see a description on sorting
  When I go to the homepage
  And I follow "sort_button"
  Then I should see "Please click on a column to sort" in "#sort-description"

Scenario:  The user should not see the sort button on the sort page 
  When I go to the homepage
  And I follow "sort_button"
  Then I should not see "Sort" in "#sort-description"
  
Scenario: The user should see default sorting by title
  When I go to the homepage
  And I follow "sort_button"
  Then I should see "Graph Theory" before "Sorting Algorithms" in the note grid
  And I should see "Analysis of Algorithms" before "Graph Theory" in the note grid
  And I should see "Big Data" before "Distributed Computing" in the note grid

  
Scenario: The user should be able to reverse sorting by title
  When I go to the homepage
  And I follow "sort_button"
  And I follow "title-sort"
  Then I should not see "Graph Theory" before "Sorting Algorithms" in the note grid
  And I should not see "Analysis of Algorithms" before "Graph Theory" in the note grid
  And I should not see "Big Data" before "Distributed Computing" in the note grid


  
Scenario: The user should be able to sort by date
  When I go to the homepage
  And I follow "sort_button"
  And I follow "created-sort"
  Then I should see "Sorting Algorithms" before "Graph Theory" in the note grid
  And I should see "Graph Theory" before "Analysis of Algorithms" in the note grid
  And I should see "Distributed Computing" before "Big Data" in the note grid

Scenario: The user should be able to reverse sort by date
  When I go to the homepage
  And I follow "sort_button"
  And I follow "created-sort"
  And I follow "created-sort"
  Then I should not see "Sorting Algorithms" before "Graph Theory" in the note grid
  And I should not see "Graph Theory" before "Analysis of Algorithms" in the note grid
  And I should not see "Distributed Computing" before "Big Data" in the note grid