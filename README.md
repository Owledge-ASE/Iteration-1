# Owledge

## Team
Sean Capaloff-Jones (sc4045)

George Cherian (gc2920)

Andrea McCormick (amm2497)

Zhengyi Li (zl3029)

## File Location

Code for project launch present at : https://github.com/Owledge-ASE/Iteration-1/tree/demo

The branch name being used is demo

RSpec tests are in https://github.com/Owledge-ASE/Iteration-1/tree/demo/spec

Cucumber tests and execution code in https://github.com/Owledge-ASE/Iteration-1/tree/demo/features

Coverage report(100%) will be generated after executing cucumber and then rspec tests at: ./coverage/index.html


## Heroku Link

Server present on: https://boiling-taiga-26082.herokuapp.com/notebooks



## List of Features

Major features added in this version(after iteration-2):
    1. Ability for users to view notes in a tree structure
    2. Clicking on tags will allow users to find search information for that tag
    3. Users can filter for only notes created by them
    4. Users can only add notes if logged in
    5. Users can filter for only notes liked/commented on by them
    6. Users can sort by number of likes now as well
    7. Updated UI of the sorting screen
    8. Users can click on the notes in the tree and be navigated to the children
    9. Minor updates to the UI on most screens to deal with formatting changes


## Preinstall

Run
```
npm install
bundle install 
rake db:create 
rake db:migrate
rake db:seed
cucumber
bundle exec rspec
rails server

```
Then open http://127.0.0.1:3000/
