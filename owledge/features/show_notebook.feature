Feature: Show Notebook

  As a note consumer
  I want to see available notes

  Background: notes have been added to the database

    Given the following notes exist:
      | subnote_id             | title                  | parent_id          | description|
      | sorting_algorithms      | Sorting Algorithms     |                    | In computer science, a sorting algorithm is an algorithm that puts elements of a list within a certain order. The most frequently used orders are numerical order and lexicographical order. Efficient sorting is important for optimizing the efficiency of other algorithms (such as search and merge algorithms) that require input data to be within sorted lists. Sorting is also often useful for canonicalizing data and for producing human-readable output.|
      | graph_theory            | Graph Theory           |                    | In mathematics, graph theory is the study of graphs, which are mathematical structures used to model pairwise relations between objects.|
      | quicksort               | Quick Sort             | sorting_algorithms | Quicksort is an efficient sorting algorithm. Developed by British computer scientist Tony Hoare within 1959 and published within 1961, it is still a commonly used algorithm for sorting. When implemented well, it can be somewhat faster than merge sort and about two or three times faster than heapsort.       |
      | heapsort                | Heap Sort              | sorting_algorithms | Heapsort can be thought of as an improved selection sort: like selection sort, heapsort divides its input into a sorted and an unsorted region, and it iteratively shrinks the unsorted region by extracting the largest element from it and inserting it into the sorted region.                           |
      | selection_sort          | Selection Sort         | sorting_algorithms | has an O(n2) time complexity, which makes it inefficient on large lists, and generally performs worse than the similar insertion sort.                                                                                                                                                                      |
      | dag                     | Directed Acyclic Graph | graph_theory       | is a directed graph with no directed cycles. That is, it consists of vertices and edges (also called arcs), with each edge directed from one vertex to another, such that following those directions will never form a closed loop.                                                                         |

  Scenario: details page for note with children and no parent
    When I go to the notebook page for "Sorting Algorithms"
    Then I should see "Sorting Algorithms" within "#title"
    And I should see "In computer science, a sorting algorithm is an algorithm that puts elements" within "#description"
    And I should see "Sorting Algorithms" within "#children"
    And I should see "Selection Sort" within "#children"
    And I should see "Heap Sort" within "#children"
    And I should see "Quick Sort" within "#children"
    But I should not see "Directed Acyclic Graph" within "#children"
    And I should not see "Sorting Algorithms" within "#children"
    And I should see 1 breadcrumb

  Scenario: click on a sub-note with no children
    When I go to the details page for "Sorting Algorithms"
    And I follow "child_heapsort"
    Then I should see "Heap Sort"
    And I should see "Heapsort can be thought of as an improved"
    And I should see 2 breadcrumbs
    And I should see a breadcrumb link to "Sorting Algorithms"
    But "#children" should not exist


  Scenario: click on Owledge logo
    When I go to the details page for "Sorting Algorithms"
    When I follow "#owledge_logo"
    Then I should be on the homepage