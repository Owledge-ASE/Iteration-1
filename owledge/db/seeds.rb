# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Notebook.create([{notebook_id:"1", title: 'Star Wars' }, {notebook_id:"2", title: 'Lord of the Rings' }])
SubNote.create([{subnote_id:"1", title: 'Star Wars' }, {subnote_id:"2", title: 'Lord of the Rings',parent_id:"1" }])
SubNote.create([{subnote_id:"3", title: 'Graph Theory',description:"sddddddddddddddddddddddddddddddddddddddddddddddddddddd" }])
