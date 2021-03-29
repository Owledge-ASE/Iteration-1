Feature: React to a note

  As a note viewer
  I want to be able to view reactions and add reactions, if I'm logged in.

  Background: User is logged in
    Given the following users exist:
      |id	| email 				| first_name     | last_name | affiliation | organization		  | password |
      |1	| example1@gmail.com  	| Andrea       	 | McCormick | Student     | Columbia University  | abcdef   |
      |2	| example5@gmail.com  	| Riley          | Casey     | Student     | Columbia University  | goodpass |

    And the following notes exist:
      |id | title                  | parent_id  | publisher_id | description                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
      |1  | Sorting Algorithms     |            | 2            | In computer science, a sorting algorithm is an algorithm that puts elements of a list within a certain order. The most frequently used orders are numerical order and lexicographical order. Efficient sorting is important for optimizing the efficiency of other algorithms (such as search and merge algorithms) that require input data to be within sorted lists. Sorting is also often useful for canonicalizing data and for producing human-readable output. |
      |2  | Graph Theory           |            | 1            | In mathematics, graph theory is the study of graphs, which are mathematical structures used to model pairwise relations between objects.                                                                                                                                                                                                                                                                                                                             |
      |3  | Quick Sort             | 1          | 2            | Quicksort is an efficient sorting algorithm. Developed by British computer scientist Tony Hoare within 1959 and published within 1961, it is still a commonly used algorithm for sorting. When implemented well, it can be somewhat faster than merge sort and about two or three times faster than heapsort.                                                                                                                                                        |
      |4  | Heap Sort              | 1          | 2            | Heapsort can be thought of as an improved selection sort: like selection sort, heapsort divides its input into a sorted and an unsorted region, and it iteratively shrinks the unsorted region by extracting the largest element from it and inserting it into the sorted region.                                                                                                                                                                                    |
      |5  | Selection Sort         | 1          | 1            | Has an O(n2) time complexity, which makes it inefficient on large lists, and generally performs worse than the similar insertion sort.                                                                                                                                                                                                                                                                                                                               |
      |6  | Directed Acyclic Graph | 2          | 1            | A Directed Acyclic Graph is a directed graph with no directed cycles. That is, it consists of vertices and edges (also called arcs), with each edge directed from one vertex to another, such that following those directions will never form a closed loop.                                                                                                                                                                                                                                  |

    And the following reactions exist:
      |id   | user_id               | note_id        | like           |
      |1    | 1                     | 5              | true           |
      |2    | 2                     | 5              | ture           |
      |3    | 1                     | 1              | true           |
      |4    | 2                     | 3              | true           |
      |5    | 1                     | 3              | true           |

    And I am logged in as "example1@gmail.com"

  Scenario: I should see the number of reactions
    When I am on the notebook page for "Selection Sort"
    Then I should see "2" inside "num_likes"
    And I should see the like button
    #And I do not like this
    #expect css with suit heart
    #do like = sweet heart filled
  Scenario: I should be able to add my reaction
    When I am on the notebook page for "Sorting Algorithms"
    Then I should see "1" inside "num_likes"
    And I follow the like button
    Then I should see "2" inside "num_likes"
    #When I do like this (after And)

  Scenario: I should be able to undo my reaction
    When I am on the notebook page for "Quick Sort"
    And I should see "2" inside "num_likes"
    When I follow the like button
    Then I should see "1" inside "num_likes"
    #And I do like this (after And)

  #Scenario: I should be able to see which notes I have reacted to
    #When I go to my profile page
    #And I have reacted to the following notes: "Quick Sort", "Selection Sort", "Sorting Algorithms"
    #Then I should see "Quick Sort" inside "#notes_reacted_to"
    #And I should see "Selection Sort" inside "#notes_reacted_to"
    #And I should see "Sorting Algorithms" inside "#notes_reacted_to"