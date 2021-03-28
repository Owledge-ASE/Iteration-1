Feature: Edit Note

  As a note user
  I want to edit node

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


Scenario: User should be able to access edit page when they are on show page
  When I go to the notebook page for "Recursive merge"
  When I follow "Edit Note"
  Then I should be on the edit page for "Recursive merge"

Scenario: User should see the title, description, and tags in the edit page
  When I go to the notebook page for "Recursive merge"
  When I follow "Edit Note"
  Then I should be on the edit page for "Recursive merge"
  Then I should see "Recursive merge"
  Then I should see the label "Title"
  Then I should see the label "Description"
  Then I should see the label "add new tags"
  Then I should see the "Update Note" button

Scenario: User should see the content of saved title, description, and tags in the edit page
  When I go to the notebook page for "Recursive merge"
  When I follow "Edit Note"
  Then I should be on the edit page for "Recursive merge"
  Then I should see "Recursive merge"
  Then I should see "Runs recursively"

Scenario: User should be able to change the fill in, and update node with new value
  When I go to the notebook page for "Recursive merge"
  When I follow "Edit Note"
  Then I should be on the edit page for "Recursive merge"
  And I fill in "note_title" with "Code Testing"
  And I fill in "note_description" with "Understanding the different paths and creating test cases to evaluate features"
  Then I press "Update Note"
  Then I should be on the details page for "Code Testing"

Scenario: User should be able to see the changed data
    When I go to the notebook page for "Recursive merge"
  When I follow "Edit Note"
  Then I should be on the edit page for "Recursive merge"
  And I fill in "note_title" with "Code Testing"
  And I fill in "note_description" with "Understanding the different paths and creating test cases to evaluate features"
  Then I press "Update Note"
  Then I should be on the details page for "Code Testing"
  Then I should see "Code Testing"
  Then I should see "Understanding the different paths and creating test cases to evaluate features" 