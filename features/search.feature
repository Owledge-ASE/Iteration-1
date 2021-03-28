Feature: Search notebooks using title and tags

  As a user
  I want to search notes and notebook using keywords

Background: notes have been added to the database

 Given the following notes exist:
 |id | title                    |parent_id | description |
 |1  | Sorting Algorithms       |          | test |
 |2  | Graph Theory             |          | test |
 |3  | Analysis of Algorithms   |          | test |
 |4  | Distributed Computing    |          | test |
 |5  | Big Data                 |          | test |
 |6  | Sorting Algorithms Child | 1        | test |
 |7  | Bubble Sort              | 1        | test |
 |8  | Merge Sort               | 1        | test |
 |9  | Recursive merge          | 8        | test |
 |10 | For merge                | 8        | test |

Scenario: If I search for "graph", I should see all "graph" nodes in search page
  When I go to the homepage
  And I fill in "search-bar" with "Graph"
  And I press "search"
  Then I should be on the notebooks_search page
  Then I should see "Graph Theory" inside list of nodes
  Then I should not see "Big Data"
  Then I should not see "Sorting Algorithms"
  Then I should not see "Analysis of Algorithms"
  Then I should not see "Distributed Computing"

Scenario: If I search for "Sort" keywords, I should see the list with sort only
  When I go to the homepage
  And I fill in "search-bar" with "Sort"
  And I press "search"
  Then I should be on the notebooks_search page
  Then I should see "Bubble Sort" inside list of nodes
  Then I should see "Merge Sort" inside list of nodes
  Then I should see "Sorting Algorithms" inside list of nodes
  Then I should not see "Big Data"
  Then I should not see "Analysis of Algorithms"
  Then I should not see "Distributed Computing"
  Then I should not see "Graph Theory"

Scenario: I should see and search bar in homepage and able to search
  When I go to the homepage
  Then I should see search bar
  And I fill in "search-bar" with "Sort"
  And I press "search"
  Then I should be on the notebooks_search page

Scenario: I should see and search bar in sort and able to search
  When I go to the homepage
  When I follow "sort_button"
  And I fill in "search-bar" with "Sort"
  And I press "search"
  Then I should be on the notebooks_search page

Scenario:  I should see and search bar in show page and able to search
  When I go to the notebook page for "Sorting Algorithms"
  Then I should see "Sorting Algorithms" inside "#title"
  And I should see search bar
  And I fill in "search-bar" with "Sort"
  And I press "search"
  Then I should be on the notebooks_search page

Scenario:  I should see and search bar in search and able to search
  When I go to the homepage
  And I fill in "search-bar" with "Sort"
  And I press "search"
  Then I should be on the notebooks_search page
  And I should see search bar
  And I fill in "search-bar" with "Sort"
  And I press "search"
  Then I should be on the notebooks_search page


