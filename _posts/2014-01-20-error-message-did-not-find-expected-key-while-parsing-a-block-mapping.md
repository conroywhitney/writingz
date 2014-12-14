---
layout: post
title: 'error message: did not find expected key while parsing a block mapping'
tags:
- rails
- error
- konreu
- tech
---
Have you received this error message while trying to run bundler, or start your rails server?

<pre><code>did not find expected key while parsing a block mapping at line 1 column 1 (Psych::SyntaxError)
</code></pre>

The problem is that your <code>database.yml</code> file is not being parsed properly because of inconsistent indentations.

Can you pick out what's wrong with this code?

<pre><code>default: &default
  adapter: postgresql
  encoding: unicode
  pool: 5

development: &development
<<: *default
  database: <%= ENV["HEROKU_POSTGRESQL_DATABASE"] %>
  username: <%= ENV["HEROKU_POSTGRESQL_USERNAME"] %>
  password: <%= ENV["HEROKU_POSTGRESQL_PASSWORD"] %>
  host: <%= ENV["HEROKU_POSTGRESQL_HOST"] %>
  port: <%= ENV["HEROKU_POSTGRESQL_PORT"] %>
</code></pre>

This code causes the <code>did not find expected key while parsing a block mapping</code> error while trying to start the rails server.

The underlying problem is that the YML inheritance line <code><<: *default</code> is indented at the same level of <code>development: &development</code> instead of the same level of <code>database:</code>. The correct code would be:

<pre><code>development: &development
  <<: *default
  database: <%= ENV["HEROKU_POSTGRESQL_DATABASE"] %>
</code></pre>

This should get rid of the <code>did not find expected key while parsing a block mapping</code> error you receive when you try to run your rails server or bundler, or anything that parses your <code>database.yml</code>.

Hopefully this solves your problem. Good luck!
