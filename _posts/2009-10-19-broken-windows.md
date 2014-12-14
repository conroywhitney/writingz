---
layout: post
title: Broken Windows
tags:
- konreu
- tech
---
<h4>
In considering our codebase, we must realize that we <b>*always*</b> have to be <i>proactive</i> in guarding against code rot. </h4>
<p>
The more we touch a certain piece of code, the more susceptible it is to degradation. For new developers coming into our codebase -- or indeed, for existing developers simply seeing a new section of the code for the first time -- the feeling can sometimes be overwhelming. Legacy paths are so brittle and so entwined that you can spend a good chunk of time stepping through just to make sure you understand correctly what is going on. By the end of this process, you have seen enough to realize that these objects are in very poor shape, but (since they are legacy and not well tested), you feel almost powerless to fix them. </p>
<p>
Surely it was not always this way. 8 years ago, when these legacy objects were being created, I believe that there must have been a sense of design and of "seeing of the whole" that was lost as: <ol>
<li>the original developers moved on -- either to different opportunities or to managerial roles -- so there were less people seeing the whole</li>
<li>the "whole" got alot bigger and became more difficult to see</li>
<li>n-th generation developers did not take the time to try to see the whole</li>
</ol>
</p>
<p>
The <a href="http://www.codinghorror.com/blog/archives/000326.html">"Broken Window Theory" of software development</a> proposes that once we start letting certain aspects of our codebase sit around with obvious flaws or we let <a href="http://martinfowler.com/bliki/TechnicalDebt.html">Technical Debt</a> build up, we will see an exponential decay of quality as developers make changes. This is based off the premise that if you do not keep a clean house, others are less likely to clean up after themselves. <p>
 <p>
With Broken Windows, the keyword is "care". Once you hit a certain level of disrepair, people kind of say "Fuck it" and just make their h4x changes. Hooligans. That's equivalent to throwing another rock through the building's few-remaining windows. </p>
<p>
Instead, we should be like a frog being dropped into hot water. We should immediately say "wait a minute, that's really, really shitty" and raise that flag to <a href="http://www2.toyota.co.jp/en/vision/production_system/jidoka.html">Stop the Line</a>. We not only have the authority, we have the responsibility. Besides, if you have legacy objects then you need to realize that your ability to respond quickly will be inversely related to how important those objects are -- so test them! And if you need to make changes to a tested object, you're covered! (no pun intended) </p>
<p>
So here's to us being less like hooligans -- who contribute to the problem because they do not feel the responsibility to contribute to the solution -- and more like ... Japanese Auto Workers? Raise the issue, make the changes, and hopefully you will save: <ol>
<li>future developers from massive confusion</li>
<li>future code aborts from undetected defects</li>
<li>and future broken windows, since developers are less likely to get mud on the carpet if it has obviously been cleaned recently</li>
</ol>
</p>
<p>
<pre>Once again, we are hungry for a lynching
That's a strange mistake to make
You should turn the other cheek
Living in a glass house
 -- <a href="http://www.azlyrics.com/lyrics/radiohead/lifeinaglasshouse.html">Life in a Glass House</a> by <a href="http://www.amazon.com/Amnesiac-Radiohead/dp/B00005B4GU/ref=pd_sim_m_3">Radiohead</a>
</pre>
</p>
