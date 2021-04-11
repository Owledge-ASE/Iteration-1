Feature: List Notebooks

  As a note consumer
  I want to see available notes

Background: notes have been added to the database

 Given the following users exist:
      |id	| email 				| first_name     | last_name | affiliation | organization		  | password |
      |1	| example1@gmail.com  	| Andrea       	 | McCormick | Student     | Columbia University  | abcdef   |
      |2	| example5@gmail.com  	| Riley          | Casey     | Student     | Columbia University  | goodpass | 

 Given the following notes exist:
 |id | title                    | publisher_id |parent_id | description                                                                                                                                                                                       |
 |1  | Sorting Algorithms       | 1            |          | In computer science, a sorting algorithm is an algorithm that puts elements of a list in a certain order.                                                                                         |
 |2  | Graph Theory             | 2            |          | In mathematics, graph theory is the study of graphs, which are mathematical structures used to model pairwise relations between objects.                                                          |
 |3  | Analysis of Algorithms   | 2            |          | In computer science, the analysis of algorithms is the process of finding the computational complexity of algorithms.                                                                             |
 |4  | Distributed Computing    | 2            |          | A distributed system is a system whose components are located on different networked computers, which communicate and coordinate their actions by passing messages to one another from any system |
 |5  | Big Data                 | 1            |          | Big data is a field that treats ways to analyze, systematically extract information from, or otherwise deal with data sets that are too large.                                                    |
 |6  | Sorting Algorithms Child | 1            | 1        | test                                                                                                                                                                                              |
 |7  | Bubble Sort              | 1            | 1        | Compares adjacent elements and moves them                                                                                                                                                         |
 |8  | Merge Sort               | 1            | 1        | Merges sorted arrays                                                                                                                                                                              |
 |9  | Recursive merge          | 1            | 8        | Runs recursively                                                                                                                                                                                  |
 |10 | For merge                | 1            | 8        | Runs recursively                                                                                                                                                                                  |
 

Scenario: Once user navigates to Owledge then they should be on the homepage
  When I go to the homepage
  Then I should be on the notebooks page

Scenario: On the homepage there should be a list of notebooks
  When I go to the homepage
  Then I should see "Graph Theory" inside list of nodes
  Then I should see "Sorting Algorithms" inside list of nodes
  Then I should see "Analysis of Algorithms" inside list of nodes
  Then I should see "Distributed Computing" inside list of nodes
  Then I should see "Big Data" inside list of nodes

Scenario: On the homepage there should be an add button if user login 
  When I am logged in as "example1@gmail.com"
  When I go to the homepage  
  Then I should see "Add Note"

Scenario: On the homepage there should be no add button if user not login 
  When I go to the homepage  
  Then I should not see "Add Note"

Scenario: If I click on the add button then they can navigate to the add page (Create page) only if user login  
  When I am logged in as "example1@gmail.com"
  When I go to the homepage
  And I follow "add-note"
  Then I should be on the create page

Scenario: If I clicks on a notebook then they will be redirected to the details page
  When I go to the homepage
  And I follow "note_1"
  Then I should be on the details page for "Sorting Algorithms"


Scenario: click on Owledge logo
  When I go to the homepage
  When I follow "owledge_logo"
  Then I should be on the homepage
