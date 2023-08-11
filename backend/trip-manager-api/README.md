# Trip Manager API

This project is the main API for Trip Manager.

Default port has been set to 3005.


## Getting Started

In this project directory, install dependencies and setup the database:
```bash
$ bundle install
$ bundle exec rake db:create
$ bundle exec rake db:migrate
```

Run the development server:
```bash
$ rails s
```


## Common commands

```bash
# run tests
$ bundle exec rake test
```


## GraphiQL

You may visit `http://localhost:3005/graphiql` to access GraphiQL, a web interface for testing GraphQL queries and mutations.
