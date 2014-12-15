---
layout: post
title: 'Unable to find css "[element_id]" (Capybara::ElementNotFound) '
tags:
- konreu
- tech
---
<p>If you are seeing this capybara error:</p>

<pre>Unable to find css "[element_id]" (Capybara::ElementNotFound)</pre>

<h3>Make sure that you actually call <code>visit</code> before trying to <code>find</code> an element!</h3>

<p>I was trying to use a regular capybara selector</p>

<pre>find("element_id").should be_visible</pre>

<p>This should have been cut and dry. Since capybara's <code>find()</code> selector uses <code>#id</code> by default, and since my page had that specific element on it, there should not have been any issue. But no matter what I tried -- more different selectors, xpaths, etc -- I kept getting the same frustrating error:</p>

<pre>Unable to find css "[element_id]" (Capybara::ElementNotFound)</pre>

<p>I thought I was going crazy, or that I had completely lost my ability to program, or both!</p>

<h3>My problem was that I had forgotten to call <code>visit</code> before calling <code>find</code></h3>

<p>As soon as I called <code>visit</code>, my error went away</p>

<pre>visit '/'
find("element_id").should be_visible
</pre>

This makes sense, though, right? If you don't call <code>visit</code> first</p>

<h3>There is no HTML content in which to find your element!</h3>

<p>It would be nice if capybara had a more descriptive error when you try to call <code>find</code> without having first called <code>visit</code>. That way this type of error would not frustrate so many people for so long!</p>

<p>I hope this helps!</p>
