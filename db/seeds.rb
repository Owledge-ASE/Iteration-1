# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created a longside the database with db: setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

graph_theory = Note.create({
                              title: 'Graph Theory',
                              description: %w{
                                In mathematics, graph theory is the study of graphs, which are mathematical structures
                                used to model pairwise relations between objects.
                              }.join(" ")
                            })
sorting = Note.create({
                            title: 'Sorting Algorithms',
                            description: %w{
                              In computer science, a sorting algorithm is an algorithm that puts elements of a list in a certain order.
                            }.join(" ")
                      }) 
Note.create([{
               title: 'Directed Acyclic Graph',
               description: %w{
                  A Directed Acyclic Graph is a directed graph with no directed cycles. That is, it consists of
                  vertices and edges (also called arcs), with each edge directed from one vertex to another, such
                  that following those directions will never form a closed loop.
               }.join(" "),
               parent_id: graph_theory.id
             }])

             
Note.create([{
          title: 'Sorting Algorithms 3',
          description: %w{
            In computer science, a sorting algorithm is an algorithm that puts elements of a list in a certain order.
          }.join(" "),
          parent_id: sorting.id
        },{
          title: 'Sorting Algorithms 4',
          description: %w{
            In computer science, a sorting algorithm is an algorithm that puts elements of a list in a certain order.
          }.join(" "),
          parent_id: sorting.id
        }])
child_note = Note.create({
          title: 'Sorting Algorithms 5',
          description: %w{
            In computer science, a sorting algorithm is an algorithm that puts elements of a list in a certain order.
          }.join(" "),
          parent_id: sorting.id
        })
Note.create([{
                              title: 'Sorting Algorithms 6',
                              description: %w{
                                In computer science, a sorting algorithm is an algorithm that puts elements of a list in a certain order.
                              }.join(" "),
                              parent_id:child_note.id
                }])

sortingtag = Tag.create({
                  tag: 'sorting'
                })
                
graphTag = Tag.create({
                  tag: 'graph'
                })

NotebookTag.create([{
                    notebook_id: graph_theory.id,
                    tag_id:graphTag.id
                  },{
                    notebook_id: child_note.id,
                    tag_id:sortingtag.id
                  },{
                    notebook_id: sorting.id,
                    tag_id:sortingtag.id
                  }
              ])   

users = User.create([{
  id: 1,
  first_name: "Andrew",
  last_name: "Peterson",
  email: "apeterson@fakeu.edu",
  password: "greatpassword",
  affiliation: "Student",
  organization: "Fake University"
}, {
 id: 2,
 first_name: "Hannah",
 last_name: "Ritter",
 email: "hritter@fakeu.edu",
 password: "thisisasafepasswordbecauseitislong",
 affiliation: "Student",
 organization: "Fake University",

}])

UserComment.create([{
  user_id: users[0].id,
  note_id: graph_theory.id,
  comment: "This is great info!"
}])
