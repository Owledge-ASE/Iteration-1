# Owledge

## Team
Sean Capaloff-Jones (sc4045)

George Cherian (gc2920)

Andrea McCormick (amm2497)

Zhengyi Li (zl3029)

## File Location
Main code is in the /owledge folder

RSpec tests are in /owledge/spec

Cucumber tests and execution code in owledge/features

## Preinstall


Install PostgreSql10 from https://www.enterprisedb.com/downloads/postgres-postgresql-downloads and setup uname and password from owledge/config/database.yml

Run
```
cd owledge
bundle install 
rake db:create 
rake db:migrate
rake db:seed
cucumber
rspec
rails server

```
Then open http://127.0.0.1:3000/

Code also present on: https://peaceful-meadow-90102.herokuapp.com/notebooks
