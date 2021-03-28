Feature: View Tags

  As a user I should be able to see existing tags on the list and show screens

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




  Given the following tags exist:
    |id |tag      |
    |1  |sorting  |
    |2  |graph    |
    |3  |algorithm|




  Given the following notebook tags exist:
    |id |notebook_id  |tag_id |
    |1  |1            |1      |
    |2  |1            |3      |
    |3  |2            |2      |
    |4  |3            |3      |
    |5  |4            |3      |
    |6  |6            |3      |
    |7  |6            |1      |
    |8  |7            |3      |
    |9  |7            |1      |
    |10  |9           |3      |
    |11 |9            |1      |




Scenario: Notes are tagged only with needed tags for sorting algorithms and graph theory nodes
  When I go to the homepage
  Then I should see "sorting" inside "#1_tag_wrapper"
  And I should see "algorithm" inside "#1_tag_wrapper"
  And I should not see "graph" inside "#1_tag_wrapper"
  And I should see "graph" inside "#2_tag_wrapper"
  And I should not see "algorithm" inside "#2_tag_wrapper"
  And I should not see "sorting" inside "#2_tag_wrapper"  
  
Scenario: Notes which do not have tags should not have any tags in the tag-wrapper
  When I go to the homepage
  Then I should not see "sorting" inside "#5_tag_wrapper"
  And I should not see "graph" inside "#5_tag_wrapper"
  And I should not see "algorithm" inside "#5_tag_wrapper"


  Scenario: Check tags for parents
    When I go to the notebook page for "Sorting Algorithms"
    Then I should see "Sorting Algorithms" inside "#title"
    And I should see "sorting" inside "#1_tag_wrapper"
    And I should see "algorithm" inside "#1_tag_wrapper"
    And I should not see "graph" inside "#1_tag_wrapper"

  Scenario: Check tags for children on parent page
    When I go to the notebook page for "Sorting Algorithms"
    Then I should see "Sorting Algorithms" inside "#title"
    And I should see "sorting" inside "#7_tag_wrapper"
    And I should see "algorithm" inside "#7_tag_wrapper"
    And I should not see "graph" inside "#7_tag_wrapper"
    And I should see "sorting" inside "#6_tag_wrapper"
    And I should see "algorithm" inside "#6_tag_wrapper"
    And I should not see "graph" inside "#6_tag_wrapper"

  Scenario: Check on children level tags inside children
    When I go to the details page for "Sorting Algorithms"
    And I follow "Bubble Sort"
    Then I should see "Bubble Sort" in "#title"
    And I should see "sorting" inside "#7_tag_wrapper"
    And I should see "algorithm" inside "#7_tag_wrapper"
    And I should not see "graph" inside "#7_tag_wrapper"