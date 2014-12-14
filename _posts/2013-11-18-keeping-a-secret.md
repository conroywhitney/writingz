---
layout: post
title: Keeping a Secret
tags:
- konreu
- tech
---
Rails 4 introduces a new way of signing cookies that differs from the previous method in Rails 3. When you upgrade to Rails 4, you are likely to receive a warning:

<code>DEPRECATION WARNING: You didn't set config.secret_key_base.</code>

As pointed out in <a href="http://edgeguides.rubyonrails.org/upgrading_ruby_on_rails.html#action-pack">the guide for upgrading rails</a>, you can simply run

<code>rake secret</code>

to generate a new secret, and paste that into <code>config.secret_key_base</code> in <code>config/initializers/secret_token.rb</code>.

However, do we really want this crucial security key to be hard-coded in our application and pushed to our repository? What if our repository is public, like in the case of an open-source app like the <a href="https://github.com/conroywhitney/gringotts-client">gringotts demo</a>?

Well, my friends, we can simply use an ENV variable to store the secret. In <code>config/initializers/secret_token.rb</code>, put this line:

<code>*YourRailsApp*::Application.config.secret_key_base = ENV["SECRET_KEY_BASE"]</code>

Now, we can check in <code>config/initializers/secret_token.rb</code> without worrying about anyone ever seeing the secret key that our application uses to encrypt cookies. But now we need to make sure that <code>ENV["SECRET_KEY_BASE"]</code> will actually be set, both locally and for Heroku.

<b>Locally,</b> we can use the nifty <a href="https://github.com/laserlemon/figaro">figaro gem</a> to set ENV variables quickly and easily. Following the instructions on the figaro github page, we add <code>gem "figaro"</code> to our <code>Gemfile</code>, run <code>rake figaro:install</code>, then edit our <code>config/application.yml</code> to add the line:

<code>SECRET_KEY_BASE: (really long string output of rake secret)</code>

<b>For Heroku,</b> we <i>could</i> use figaro's helper rake task for updating Heroku's config vars (<code>rake figaro:heroku</code>). However, what if we accidentally check in our <code>config/application.yml</code> file? We'd be sharing the secret key used to encrypt our cookies on our production server. <a href="http://www.homestarrunner.com/tgs3.html">Noooo good!</a>

Preferably, we can generate a separate secret key for Heroku

<code>heroku config:set SECRET_KEY_BASE=$(rake secret)</code>

Just realize that when you change your secret key base, all previous versions of your cookies will no longer be valid.

And that's that. We are now Rails 4 compliant (no more DEPRECATION warning), <b>and</b> we have the added bonus of keeping our secret a secret.

Additional Resources:
<ul>
<li><a href="http://blog.envylabs.com/post/41711428227/rails-4-security-for-session-cookies">http://blog.envylabs.com/post/41711428227/rails-4-security-for-session-cookies</a></li>
<li><a href="http://stackoverflow.com/questions/18556955/heroku-config-secret-key-base-error">http://stackoverflow.com/questions/18556955/heroku-config-secret-key-base-error</a></li>
<li><a href="http://edgeguides.rubyonrails.org/upgrading_ruby_on_rails.html#action-pack>http://edgeguides.rubyonrails.org/upgrading_ruby_on_rails.html#action-pack</a></li>
<li><a href="http://dev.mensfeld.pl/2013/06/upgrading-to-rails-4-0-from-rails-3-2-test-case-part-i-preparations-configuration-gems/">http://dev.mensfeld.pl/2013/06/upgrading-to-rails-4-0-from-rails-3-2-test-case-part-i-preparations-configuration-gems/</a></li>
<li><a href="https://github.com/laserlemon/figaro">https://github.com/laserlemon/figaro</a></li>
</ul>

