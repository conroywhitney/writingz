---
layout: post
title: Needing to Scale is a Good Problem to Have
tags:
- konreu
- tech
---
<p>
I just finished listening to <a href="http://www.infoq.com/presentations/Scale-at-Facebook">Scale at Facebook</a> from <a href="http://www.infoq.com/QConLondon2010">InfoQ QCon 2010</a> where Aditya Agarwal (Director of Engineering at Facebook) discusses the layers that make up Facebook and where/how their content is stored, retrieved, aggregated, and presented.</p>
<p>
This was an excellent talk, not only because Aditya gave good explanations of both the problems and the solutions that Facebook has worked through, but because he repeatedly emphasized: needing to scale is a good problem to have.</p>
<p>
One of my favourite examples of this concept from this talk was Facebook Photos. When they launched Photos in May 2006, they created a solution that was quick, lean, and allowed for iterative improvement in the future; they did not over-architecture the solution.</p>
<p>
As a result, they were able to launch Photos in 2 months which they considered to be a great competitive advantage.</p>
<p>
They could not have predicted, in advance, how well this feature would be adopted. I remember when Photos came out -- I found it a bit strange, because that was not how I was currently using Facebook at the time. In fact, my first Photo album, "important things to remember", contains <a href="http://sphotos.ak.fbcdn.net/photos-ak-sf2p/v12/229/113/12803586/n12803586_30089384_9419.jpg">this image of colours</a> that allowed me to test the "in this photo" tagging (you over over the colours and you are given their names). That is how seriously I took the feature at the time.</p>
<p>
However, within 3 months, the Photos feature was so widely-used that it was time for a rewrite. Spending 2 months on a solution that lasted 3 months may seem like "waste", but consider which is the larger waste: 2 months to test a product in the market, before your competitors, with the option to iterate and improve later; or more than 2 months to over-architect a solution for a product that you do not know -- for sure -- will be adopted.</p>
<p>
Yes, there is the ideal middle-ground where in a perfect world you know exactly how many users will adopt your product and thus spend an appropriate amount of development time scaling the issue; however, from my experience, marketing tends to over-estimate product adoption rates as often as developers tend to over-architect solutions.</p>
<p>
The question then becomes: which would you rather have? Over-architected? Or under-architected? To echo Aditya's sentiments: needing to scale is a good problem to have.</p>
