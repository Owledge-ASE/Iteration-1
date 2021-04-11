Feature: Comment on a note

  As a note viewer
  I want to be able to view comments, and add, if I'm logged in,
  edit my comments and add new comments.

  Background: User is logged in
    Given the following users exist:
      |id	| email 				| first_name     | last_name | affiliation | organization		  | password |
      |101	| example1@gmail.com  	| Andrea       	 | McCormick | student     | Columbia University  | abcdef   |
      |102	| example5@gmail.com  	| Riley          | Casey     | student     | Columbia University  | goodpass |

    And the following notes exist:
      |id | title                  | parent_id  | publisher_id | description                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
      |1  | Sorting Algorithms     |            | 102            | In computer science, a sorting algorithm is an algorithm that puts elements of a list within a certain order. The most frequently used orders are numerical order and lexicographical order. Efficient sorting is important for optimizing the efficiency of other algorithms (such as search and merge algorithms) that require input data to be within sorted lists. Sorting is also often useful for canonicalizing data and for producing human-readable output. |
      |2  | Graph Theory           |            | 101            | In mathematics, graph theory is the study of graphs, which are mathematical structures used to model pairwise relations between objects.                                                                                                                                                                                                                                                                                                                             |
      |3  | Quick Sort             | 1          | 102            | Quicksort is an efficient sorting algorithm. Developed by British computer scientist Tony Hoare within 1959 and published within 1961, it is still a commonly used algorithm for sorting. When implemented well, it can be somewhat faster than merge sort and about two or three times faster than heapsort.                                                                                                                                                        |
      |4  | Heap Sort              | 1          | 102            | Heapsort can be thought of as an improved selection sort: like selection sort, heapsort divides its input into a sorted and an unsorted region, and it iteratively shrinks the unsorted region by extracting the largest element from it and inserting it into the sorted region.                                                                                                                                                                                    |
      |5  | Selection Sort         | 1          | 101            | Has an O(n2) time complexity, which makes it inefficient on large lists, and generally performs worse than the similar insertion sort.                                                                                                                                                                                                                                                                                                                               |
      |6  | Directed Acyclic Graph | 2          | 101            | A Directed Acyclic Graph is a directed graph with no directed cycles. That is, it consists of vertices and edges (also called arcs), with each edge directed from one vertex to another, such that following those directions will never form a closed loop.                                                                                                                                                                                                                                  |

    And the following comments exist:
      | user_id               | note_id        | comment                                                |
      | 101                     | 1              | Thanks, this helped me a lot!                        |
      | 102                     | 6              | What if a graph has cycles but it's directed?        |
      | 101                     | 6              | You can still use some DAG concepts if you use SCC.  |
      | 102                     | 6              | Oh, I see, thanks!                                   |

    And I am logged in as "example1@gmail.com"

  Scenario: I should see comments
    When I am on the notebook page for "Directed Acyclic Graph"
    Then I should see a comment "What if a graph has cycles but it's directed?" by "example5@gmail.com"
    And I should see a comment "You can still use some DAG concepts if you use SCC." by "example1@gmail.com"

  Scenario: I should be able to edit my comments
    When I am on the notebook page for "Sorting Algorithms"
    Then I should see a comment "Thanks, this helped me a lot!"
    And I should see "Edit" in "#comment_1_edit"
    When I follow the link "#comment_1_edit"
    Then I should be on the edit comment page for comment 1

    When I fill in "comment_comment" with "Sorting algorithms changed my life!"
    And I press "Update Comment"
    Then I should be on the notebook page for "Sorting Algorithms"
    And I should see "Comment updated!" in "#success_message"

  Scenario: I should be able to delete my comments
    When I am on the edit comment page for comment 1
    And I follow "Delete"
    Then I should be on the notebook page for "Sorting Algorithms"
    And I should see "Comment deleted" in "#success_message"

  Scenario: I should not be able to edit another person's comment.
    When I go to the edit comment page for comment 2
    Then I should be on the notebook page for "Directed Acyclic Graph"
    And I should see "You cannot perform this action." in "#error_message"

  Scenario: I should not be able to delete another person's comments.
    When I try to delete comment 2
    Then I should be on the notebook page for "Directed Acyclic Graph"
    And I should see "You cannot perform this action." in "#error_message"

  Scenario: I should be able to get to the new comments page from a note page.
    When I am on the notebook page for "Directed Acyclic Graph"
    And I follow "Add Comment"
    Then I should be on the new comment page for "Directed Acyclic Graph"

  Scenario: I should be able to add a new comment
    When I am on the new comment page for "Sorting Algorithms"
    And I fill in "comment_comment" with "What is an Algorithm?"
    And I press "Create Comment"
    Then I should be on the notebook page for "Sorting Algorithms"
    And I should see "Comment added!" in "#success_message"

  Scenario: I should not be able to add a blank comment when adding
    When I am on the new comment page for "Sorting Algorithms"
    And I press "Create Comment"
    And I should see "Could not save comment." in "#error_message"
    And I should see "Comment can't be blank" in "#error_message li"
    And I should see "Comment is too short (minimum is 10 characters)" in "#error_message li"

  Scenario: I should not be able to add a blank comment when editing
    When I am on the edit comment page for comment 1
    And I fill in "comment_comment" with "tooshort"
    And I press "Update Comment"
    And I should see "Could not save comment." in "#error_message"
    And I should see "Comment is too short (minimum is 10 characters)" in "#error_message li"

  Scenario: When I try to go to the comments index page, I get redirected.
    When I am on the comment page for "Sorting Algorithms"
    Then I should be on the notebook page for "Sorting Algorithms"