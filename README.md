# Owledge

## Team
Sean Capaloff-Jones (sc4045)

George Cherian (gc2920)

Andrea McCormick (amm2497)

Zhengyi Li (zl3029)

## File Location

Code for the demo is present at : https://github.com/Owledge-ASE/Iteration-1/

The branch name being used is main

RSpec tests are in https://github.com/Owledge-ASE/Iteration-1/spec

Cucumber tests and execution code in https://github.com/Owledge-ASE/Iteration-1/features

Coverage report(100%) will be generated after executing cucumber and then rspec tests at: ./coverage/index.html


## Heroku Link

Server present on: https://boiling-taiga-26082.herokuapp.com/notebooks

## Video

Youtube link:  https://youtu.be/TA50f0Er68I

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
