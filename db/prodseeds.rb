# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created a longside the database with db: setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ai_search = Note.create({
                   title: 'Adversarial Search',
                   description: %w{
                   In artificial intelligence, Adversarial Search provides serveral approaches for competitive multi-agent environments.
                   It does not consider goals and motivations of adversaries, and other agents are considered as part of a nondeterministic
                   environment. This category of search algorithms will often have to operate real-time, and often accepts suboptimal solutions.
                   }.join( " ")
                 })
zerosum = Note.create(
               title: 'Two-Player Zero-Sum Games',
               description: %w{Two agents, turn-taking, deterministic, perfect information (fully observable), zero-sum
               (p1 wins = p2 loses and vice-versa). Includes states (current state of the game), actions (set of legal moves in a state S),
               transition model (mapping from (state, action) to a new state), terminal test (is the current state a terminal state - game over?).
               Utility function: A player's "score" or payoff at a terminal state:
               Utility(s, P1) = -Utility(s, P2)
               }.join(" "),
              parent_id: ai_search.id
              )
minimax = Note.create(
              title: 'Minimax Search Algorithm',
              description: %w{
              The vale of each state depends on each player's move. If we know that each player plays optimally, the entire game tree's values are known! Each level in the
              minimax tree alternates turns between the min-player or max-player; thus, whichever player's turn it is always plays optimally.
              This algorithm executes DFS-style search of the game tree. It is optimal if both players play perfectly, and it is complete if the game eventually ends.
              }.join(" "),
                parent_id: ai_search.id
                           )
Note.create({
               title: 'Minimax Value',
description: %w{
Utility of a state assuming BOTH players play optimally until the end of the game.
This value is calculated at each step in the minimax tree, and it is dependent upon whether
player's turn it is (i.e. max-player or min-player).
}.join(" "),
  parent_id: minimax.id
             })
Note.create({
               title: 'Alpha-Beta Pruning',
description: %w{
General idea: Keep track of the highest (alpha) and lowest (beta) values seen so far
by MAX and MIN nodes, respectively. This algorithm skips the remaining children (prunes) if:
MAX sees a value higher than (beta) or MIN sees a value lower than (alpha). Always assume that the
root is a MAX node.

Pruning does not change the true minimax value of the root. Intermediate (children) node values might be wrong!
If pruning, game tree values cannot be reused, and you must rerun minimax after each move.
}.join(" "),
  parent_id: ai_search.id
             })



searchtag = Tag.create({
                  tag: 'search'
                })

NotebookTag.create([{
                    notebook_id: ai_search.id,
                    tag_id:searchtag.id
                  },{
                      notebook_id: zerosum.id,
                      tag_id: searchtag.id
                    }, {
                      notebook_id: minimax.id,
                      tag_id: searchtag.id
                    }
              ])

users = User.create([{
  first_name: "Andrew",
  last_name: "Peterson",
  email: "apeterson@fakeu.edu",
  password: "greatpassword",
  affiliation: "Student",
  organization: "Fake University"
}, {
 first_name: "Hannah",
 last_name: "Ritter",
 email: "hritter@fakeu.edu",
 password: "thisisasafepasswordbecauseitislong",
 affiliation: "Student",
 organization: "Fake University",

},{
 first_name: "Riley",
 last_name: "Smith",
 email: "rsmith@fakeu.edu",
 password: "thisisasafepasswordbecauseitislong",
 affiliation: "Student",
 organization: "Fake University",
},{
 last_name: "Prince",
 email: "prince@fakeu.edu",
 password: "thisisasafepasswordbecauseitislong",
 affiliation: "Student",
 organization: "Fake University",
},{
 first_name: "George",
 last_name: "",
 email: "geo@fakeu.edu",
 password: "thisisasafepasswordbecauseitislong",
 affiliation: "Student",
 organization: "Fake University",
}])

