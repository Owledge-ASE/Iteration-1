# Owledge

## Team
Sean Capaloff-Jones (sc4045)

George Cherian (gc2920)

Andrea McCormick (amm2497)

Zhengyi Li (zl3029)

## File Location

Code present at : https://github.com/Owledge-ASE/Iteration-1

Main code is in the /owledge folder

RSpec tests are in https://github.com/Owledge-ASE/Iteration-1/tree/main/owledge/spec

Cucumber tests and execution code in https://github.com/Owledge-ASE/Iteration-1/tree/main/owledge/features

## Heroku Link

Server present on: https://peaceful-meadow-90102.herokuapp.com/notebooks

## Preinstall


Run
```
cd owledge
bundle install 
rake db:create 
rake db:migrate
rake db:seed
cucumber
bundle exec rspec
rails server

```
Then open http://127.0.0.1:3000/

