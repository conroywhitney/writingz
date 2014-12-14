---
layout: post
title: Appraising Your Gem
tags:
- konreu
- tech
---
<p>One might argue that the more versions of ruby and rails your gem supports, the more valuable it is to the general population. Well, I guess it <em>does</em> also depend on what your gem does (<a href="https://github.com/busyloop/lolcat">rainbows and unicorns?</a>).</p>

<p>Thoughtbot has done it again with <a href="https://github.com/thoughtbot/appraisal">appraisal</a>, a neat and nifty gem for testing your gem in different ruby and rails environments. It's especially useful when combined with Travis to specify which continuous integration environments should be used or ignored. (see <a href="https://github.com/conroywhitney/gringotts/blob/master/.travis.yml">gringott's travis.yml</a> for an example).</p>

<p><strong>Note:</strong> <a href="https://github.com/thoughtbot/appraisal/blob/master/README.md">appraisal's README</a> on github is curently for for the 1.0.0.beta2 version. This can be confusing since the current rubygems version (and what you get if you just do <code>gem "appraisal"</code> is 0.5.2. You can either use the beta version with <code>gem "appraisal", "1.0.0.beta2"</code>, or, you can use <a href="https://github.com/thoughtbot/appraisal/blob/v0.5.2/README.md">the 0.5.2 version of the README</a></p>

<p>As mentioned in the README, you can run your spec and cucumber tests against these ruby/rails versions using appraisal. What's <em>not</em> mentioned, though, is that you can also run your local webserver against your different appraisals as well.</p>

<p>Since appraisal essentially just pre-compiles the bundles that you are going to use for your different appraisals (e.g., rails-3.2, rails-4.0), you can use that to your advantage:</p>

<p>First, find out the path to the bundle that you want to test locally:</p>

<pre><code> rake appraisal:install
</code></pre>

<p>Look for the line that like:</p>

<pre><code> bundle check --gemfile='/pathbot/to/rails/engine/gemfiles/rails_4.0.gemfile'
</code></pre>

<p>We are going to hand that path to our webserver so it knows what bundle to use. However, instead of using the --gemfile option, we are going to pass it as an inline environment variable:</p>

<pre><code> BUNDLE_GEMFILE='/path/to/rails/app/gemfiles/rails_3.2.gemfile' bundle exec rails server
</code></pre>

<p>Or, if you are developing an engine, you can run your dummy app's rails server using</p>

<pre><code> BUNDLE_GEMFILE='/path/to/rails/engine/gemfiles/rails_3.2.gemfile' bundle exec spec/dummy/bin/rails server
</code></pre>

<p><strong>Note:</strong> spec/dummy is the location of your engine's dummy app. This might instead be in test/dummy, depending on how you set your engine up.</p>

<p>Running a local webserver against different ruby/rails appraisals is useful for being able to manually play around with why a particular test might not be working in a particular bundle (e.g.,only on ruby-1.9.3@rails-3.2).</p>

<p>One last thing, maybe this was just something quirky on my end, but I ended up having issues when running my rake tests against my rails-3.* appraisals. I kept encountering this error:</p>

<pre><code> undefined method `migration_error=' for ActiveRecord::Base:Class
</code></pre>

<p>Unable to find a solution, I am embarassed to say that I instead took the lazy (and very time-consuming) way out of repeatedly pushing to github after every commit so that Travis would run my rails-3.* tests for me so I could debug where my issue might be occurring. That wasted not only a lot of my time (5 minutes between fix and result), but also a lot of Travis' server hours... Sorry guys! Let me know how I can <a href="https://love.travis-ci.org/">show you some love</a>.</p>

<p>Anyway, the hidden clue to the solution to the <code>undefined method</code> issue was hidden in one of the comments on one of the unaccepted answers of <a href="
http://stackoverflow.com/questions/18000712/rake-aborted-undefined-method-migration-error-for-activerecordbaseclass">one of the StackOverflow questions</a>. As Iliya Stepanov points out, </p>

<blockquote>
  <p>It was one string in config/initializers or environment. I don't remember exactly what string it was, but check carefully that files if you rolling back from Rails 4 to 3 and facing similar problems.</p>
</blockquote>

<p>It turns out that in <code>spec/dummy/config/environments/development.rb</code> there is this line:</p>

<pre><code> config.active_record.migration_error = :page_load
</code></pre>

<p>I commented that out, and everything worked hunky dorey. It doesn't make me happy to think that I am suppressing potentially useful errors, but there were no migrations that needed to be migrated. Also, I'm pretty sure that might have only been related to the fact that I created a rails4 engine, then was trying to backport its dummy to rails3. Pretty sure.</p>

<p><a href="http://www.youtube.com/watch?v=qKVVDAKi_d4">And that's the end of that that chapter.</a></p>
