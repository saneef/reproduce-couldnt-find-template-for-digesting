# Reproducing “Couldn't find template for digesting”

# Scaffolding

```bash
$ bundle install
$ rake db:migrate
$ bundle exec rake db:fixtures:load FIXTURES=books
$ bundle exec rails dev:cache # enable cache in development environment
```

# Problem

On a regular page load all caching works. But only on rendering `js.erb` `Couldn't find template for digesting` error occors.

## Steps to reproduce

Run the server following above steps.

```bash
$ bundle exec rails server
```

Click on any of the heart icon. It invokes a ajax patch, for which `/app/views/books/update.js.erb` is rendered. That’s when the error occurs. See this log (look for 🔥).

```bash
Started PATCH "/books/113629430" for 127.0.0.1 at 2017-06-12 05:04:42 +0530
Processing by BooksController#update as JS
  Parameters: {"id"=>"113629430"}
  Book Load (0.2ms)  SELECT  "books".* FROM "books" WHERE "books"."id" = ? LIMIT ?  [["id", 113629430], ["LIMIT", 1]]
   (0.1ms)  begin transaction
  SQL (0.6ms)  UPDATE "books" SET "favorite" = ?, "updated_at" = ? WHERE "books"."id" = ?  [["favorite", "t"], ["updated_at", "2017-06-11 23:34:42.976896"], ["id", 113629430]]
   (1.5ms)  commit transaction
  Rendering books/update.js.erb
  Couldn't find template for digesting: icons/_icon # <--- 🔥
  Rendered icons/_icon.html.erb (2.8ms) [cache hit]
  Rendered books/update.js.erb (7.0ms)
Completed 200 OK in 32ms (Views: 18.9ms | ActiveRecord: 2.4ms)
```
