Feature: Show my notebooks dashboard

As a note consumer
I want to see the notes that I created, liked, or commented on

Background: User is logged in
  Given the following users exist:
    |id	| email 				| first_name     | last_name | affiliation | organization		  | password |
    |101	| example1@gmail.com  	| Andrea       	 | McCormick | Student     | Columbia University  | abcdef   |
    |102	| example5@gmail.com  	| Riley          | Casey     | Student     | Columbia University  | goodpass |

  And the following notes exist:
    |id | title                  | parent_id  | publisher_id | description                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
    |1  | Sorting Algorithms     |            | 102            | In computer science, a sorting algorithm is an algorithm that puts elements of a list within a certain order. The most frequently used orders are numerical order and lexicographical order. Efficient sorting is important for optimizing the efficiency of other algorithms (such as search and merge algorithms) that require input data to be within sorted lists. Sorting is also often useful for canonicalizing data and for producing human-readable output. |
    |2  | Graph Theory           |            | 101            | In mathematics, graph theory is the study of graphs, which are mathematical structures used to model pairwise relations between objects.                                                                                                                                                                                                                                                                                                                             |
    |3  | Quick Sort             | 1          | 102            | Quicksort is an efficient sorting algorithm. Developed by British computer scientist Tony Hoare within 1959 and published within 1961, it is still a commonly used algorithm for sorting. When implemented well, it can be somewhat faster than merge sort and about two or three times faster than heapsort.                                                                                                                                                        |
    |4  | Heap Sort              | 1          | 102            | Heapsort can be thought of as an improved selection sort: like selection sort, heapsort divides its input into a sorted and an unsorted region, and it iteratively shrinks the unsorted region by extracting the largest element from it and inserting it into the sorted region.                                                                                                                                                                                    |
    |5  | Selection Sort         | 1          | 101            | Has an O(n2) time complexity, which makes it inefficient on large lists, and generally performs worse than the similar insertion sort.                                                                                                                                                                                                                                                                                                                               |
    |6  | Directed Acyclic Graph | 2          | 101            | A Directed Acyclic Graph is a directed graph with no directed cycles. That is, it consists of vertices and edges (also called arcs), with each edge directed from one vertex to another, such that following those directions will never form a closed loop.                                                                                                                                                                                                         |

  And the following comments exist:
    | user_id                 | note_id        | comment                                              |
    | 101                     | 1              | Thanks, this helped me a lot!                        |
    | 102                     | 6              | What if a graph has cycles but it's directed?        |
    | 101                     | 6              | You can still use some DAG concepts if you use SCC.  |
    | 102                     | 6              | Oh, I see, thanks!                                   |

  And the following reactions exist:
    |id   | user_id                 | note_id        | like           |
    |1    | 101                     | 5              | true           |
    |2    | 102                     | 5              | ture           |
    |3    | 101                     | 1              | true           |
    |4    | 101                     | 3              | true           |
    |5    | 102                     | 3              | true           |
    |6    | 101                     | 6              | true           |

  And I am logged in as "example1@gmail.com"

#Scenario: I should see the notebooks that I created by default
#When I am on the notebooks dashboard
#And I see "My Created Notes" inside #filer"
#Then I should see "Graph Theory" inside "#title"

#Scenario: Once user clicks on the filter button then they should be on the Dashboard Page
  #When I go to the homepage
  #And I select "my_notes" inside "#notes_filter"
  #Then I should be on the notebooks dashboard page
  #And I should see "Graph Theory" in the note grid
  #And I should see "Selection Sort" in the note grid
  #And I should see "Directed Acyclic Graph" in the note grid

Scenario: I should see the notes I created on the dashboard Page
  When I am on the notebooks dashboard page
  And I select "Notes Created"
  Then I should see "Graph Theory" inside list of nodes
  And I should see "Selection Sort" inside list of nodes
  And I should see "Directed Acyclic Graph" inside list of nodes

Scenario: I should see the notes I liked if I filter by likes
  When I am on the notebooks dashboard
  And I select "Notes Liked"
  Then I should see "Selection Sort" inside list of nodes
  And I should see "Sorting Algorithms" inside list of nodes
  And I should see "Quick Sort" inside list of nodes
  And I should see "Directed Acyclic Graph" inside list of nodes

Scenario: I should see the notes I liked if I filter by likes
  When I am on the notebooks dashboard
  And I select "Notes Commented"
  Then I should see "Sorting Algorithms" inside list of nodes
  And I should see "Directed Acyclic Graph" inside list of nodes
  And I should not see "Quick Sort" inside list of nodes
  And I should not see "Selection Sort" inside list of nodes

Scenario: I should see the Add Note button on the Dashboard page
  When I am on the notebooks dashboard
  And I follow "Add note"
  Then I should be on the create notebook page

#Scenario: I should not be able to see the notes that I unlike


