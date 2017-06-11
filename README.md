# Reproducing "Couldn't find template for digesting"

# Scaffolding

```bash
$ bundle install
$ bundle exec rake db:fixtures:load FIXTURES=books
$ bundle exec rails dev:cache # enable cache in development environment
$ bundle exec rails server
```
