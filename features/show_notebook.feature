Feature: Show Notebook

  As a note consumer
  I want to see available notes

  Background: notes have been added to the database

    Given the following notes exist:
    |id | title                  | parent_id  | description                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
    |1  | Sorting Algorithms     |            | In computer science, a sorting algorithm is an algorithm that puts elements of a list within a certain order. The most frequently used orders are numerical order and lexicographical order. Efficient sorting is important for optimizing the efficiency of other algorithms (such as search and merge algorithms) that require input data to be within sorted lists. Sorting is also often useful for canonicalizing data and for producing human-readable output. |
    |2  | Graph Theory           |            | In mathematics, graph theory is the study of graphs, which are mathematical structures used to model pairwise relations between objects.                                                                                                                                                                                                                                                                                                                             |
    |3  | Quick Sort             | 1          | Quicksort is an efficient sorting algorithm. Developed by British computer scientist Tony Hoare within 1959 and published within 1961, it is still a commonly used algorithm for sorting. When implemented well, it can be somewhat faster than merge sort and about two or three times faster than heapsort.                                                                                                                                                        |
    |4  | Heap Sort              | 1          | Heapsort can be thought of as an improved selection sort: like selection sort, heapsort divides its input into a sorted and an unsorted region, and it iteratively shrinks the unsorted region by extracting the largest element from it and inserting it into the sorted region.                                                                                                                                                                                    |
    |5  | Selection Sort         | 1          | has an O(n2) time complexity, which makes it inefficient on large lists, and generally performs worse than the similar insertion sort.                                                                                                                                                                                                                                                                                                                               |
    |6  | Directed Acyclic Graph | 2          | A Directed Acyclic Graph is a directed graph with no directed cycles. That is, it consists of vertices and edges (also called arcs), with each edge directed from one vertex to another, such that following those directions will never form a closed loop.                                                                                                                                                                                                                                  |

  Scenario: details page for note with children and no parent
    When I go to the notebook page for "Sorting Algorithms"
    Then I should see "Sorting Algorithms" inside "#title"
    And I should see "In computer science, a sorting algorithm is an algorithm that puts elements" inside "#description"
    And I should see "Selection Sort" inside "#children"
    And I should see "Heap Sort" inside "#children"
    And I should see "Quick Sort" inside "#children"
    But I should not see "Directed Acyclic Graph" in "#children"
    And I should not see "Sorting Algorithms" in "#children"
    And I should see 1 breadcrumb

  Scenario: click on a sub-note with no children
    When I go to the details page for "Sorting Algorithms"
    And I follow "Heap Sort"
    Then I should see "Heap Sort" in "#title"
    And I should see "Heapsort can be thought of as an improved"
    And I should see 2 breadcrumbs
    And I should see a breadcrumb link to "Sorting Algorithms"
    But "#children" should not exist

  Scenario: get to a sub-note that does not exist (sad path)
    When I go to the notebook with ID 1010
    Then I should be on the homepage
    And I should see "Could not find a note with ID 1010" inside "#error_message"

  Scenario: click on Owledge logo
    When I go to the details page for "Sorting Algorithms"
    When I follow "owledge_logo"
    Then I should be on the homepage

  
Scenario: On the details should be an add button
  When I go to the details page for "Sorting Algorithms"
  Then I should see "Add Note"