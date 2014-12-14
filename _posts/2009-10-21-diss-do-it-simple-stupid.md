---
layout: post
title: 'DISS: Do It Simple, Stupid!'
tags:
- konreu
- tech
---
<div class="book">
<a href="http://www.amazon.com/Implementing-Lean-Software-Development-Concept/dp/0321437381/"><img src="http://ecx.images-amazon.com/images/I/51CrrTeaEzL._SL500_AA240_.jpg" alt="Implementing Lean Software Development: From Concept to Cash" height="100" /><span class="book_caption">Implementing Lean Software Development: From Concept to Cash</span></a> </div>
<h4>
Do it simply, quickly, and learn. Then go back and do it again.</h4>
<p>
Reading the "Quality" chapter in "Implementing Lean" book (our Tech Bible), I was really trying to overlay their prescribed development cycle over our recent projects, and see what things would be like if we had followed their prophecies to the letter. </p>
<h4>
Step One: Write Tests</h4>
<p>
We would be using TDD in a religious fashion. They begin each user story by writing test cases that need implementation in order to pass. We tend to write test cases as things start solidifying or (in the case of our Selenium tests (read: regression tests) we write them after customer delivery). In my next projects, I will be using TDD to see how it really works in our environment. More on that later. </p>
<p>
With black-box testing (which, let's face it, is what you are doing in TDD), you have to think of not only the cases where "it should work", but also the cases where "it should not break". Very different. That is a challenge that I have had with Black Boxing -- you have to be very careful to think (read: pre-imagine) the different harsh treatment that your software will be enduring down the road. Suffice to say, it is <b>*very*</b> important that your TDD takes into account what you <b>*don't*</b> want your system to do as much as what you <b>*do*</b> want it to do. </p>
<h4>
Step Two: Solve in the Simplest Way</h4>
<p>
We would do the simplest thing possible to get the test cases passing. The idea is, if you write your tests cases correctly, then when they pass you are theoretically done. </p>
<p>
A main component of Lean Development is "Delivering Fast". The faster your code is out there, the faster you can learn from it. The more knowledge you have, the better decisions you can make. Delivering Fast does <i>necessarily</i> mean making reckless decisions. Martin Fowler's <a href="http://www.martinfowler.com/bliki/TechnicalDebtQuadrant.html">Technical Debt Quadrant</a> should help illustrate the concept that: </p>
<pre>It is OK to Incur Technical Debt, *IF* it is Prudent</pre>
<p>
Delivering Fast means that you incur Deliberate, Prudent debt in order to gain the most knowledge the most quickly. Which leads to...  <h4>
Step Three: Refactor</h4>
<p>
After "going into the hole", technically, you need to clean up after yourself so that it is obvious what the code is meant to do, and how it is meant to do it <b>*and*</b> so you do not have to pay interest on that debt down the road. </p>
<p>
Martin Fowler's idea of Prudent, Inadvertent debt is a long term concept, where you do not necessarily even notice the interest you are paying until long after you took out the loan. This is not the situation that warrants immediate refactoring. Rather, it is the Prudent, Deliberate debt that you need to pay down. Let me say this, though: </p>
<pre>Do not attempt Step Three without having done Step One</pre>
<p>
If you do not have good testing in place, refactoring can be both tedious and dangerous. And it is not supposed to be! Refactoring is supposed to be a no-sweat, "Now I see that this will be much easier to work with if we do it like this", post-learning experience. It should not be a "I hope I did not break something" experience. </p>
<p>
The reason that The R Word is shunned in so many workshops is because they have legacy (read: un-tested) code. I know: I currently work in one! </p>
<h4>
Personal Take-Aways</h4>
<p>
I personally am admittedly, chronically, and (perhaps?) notoriously infamous for over-engineering situations. Some might call it a lack of common sense. Some might call it a dull <a href="http://en.wikipedia.org/wiki/Occam's_razor">Occam's Razor</a>. Some might call it not "Seeing the Whole" </p>
<p>
This means that I often fall into a trap that could be avoided by printing out this concept from the Implementing Lean book and taping it to my monitor: </p>
<pre>Do it Simple *Then* Refactor!</pre>
<p>
How many times have you gone in to implement a user requirement and seen an opportunity for refactoring. So as you are implementing, you are refactoring with the "future implementation" in mind. And how many times have you realized, during this process, that you did not foresee a technical difficulty? And what does that mean: that neither your implementation nor your refactoring can proceed. Everything has to be reverted, and you have to go down the one-at-a-time path anyways. <i>So start one-at-a-time from the very beginning!</i> </p>
<p>
So here's to doing the simple thing the first time. And to learning from it. And to cleaning things up when the situation warrants it. </p>
<h3>
Do it Simple, Stupid!</h3>
<pre>Hey what would it mean to you?
To know that it'll
Come back around again
Hey whatever it means to you
Know that everything
Moves in circles
  -- <a href="http://www.sing365.com/music/lyric.nsf/Circles-lyrics-Incubus/70E7E5F01AEE339B48256AE10022F81A">"Circles"</a> by <a href="http://www.amazon.com/Make-Yourself-Incubus/dp/B0000296JB">Incubus</a>
</pre>
