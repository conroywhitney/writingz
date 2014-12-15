---
layout: post
title: Real-Time, In-Browser Notifications with Node.js and Faye (HTML5 WebSockets)
tags:
- konreu
- tech
---
For real-time, in-browser notifications, I just learned about this at a Node.js Meetup presented by <a href="http://www.xydo.com/">Xydo</a> (let me know if you would like an invite). Xydo wanted to be able to notify a user in their browser whenever an event happened (like a friend sent them a direct message; or a news topic they followed was updated). The main idea is that the user should not have to refresh their page to see that these events are happening -- they should know in real-time, in their browser.

The traditional method of doing this is to use <a href="http://en.wikipedia.org/wiki/Polling_(computer_science)">polling</a> -- you have a client-side script that pings your server for any new messages that the user may want to know. This method is high CPU and high I/O (having to keep pinging your server can overload it with requests, and having to keep checking your database can cause an I/O bottleneck). Needless to say, this does not scale well.

The <a href="http://www.xydo.com/">Xydo</a> solution utilizes two "hot, new technologies": <a href="http://nodejs.org/">Node.js</a> and <a href="http://en.wikipedia.org/wiki/WebSocket">HTML5 WebSockets</a>. The idea is that they keep an open connection from the browser to the server which allows for communication from the server to the browser, even after the initial request.

Why is Node.js important? Well, because <a href="http://zgadzaj.com/benchmarking-node-js-testing-performance-against-apache-php/">Node.js can handle <b>orders of magnitude</b> more connections than a traditional webserver (like Apache) can</a>. A traditional webserver receives a request, blocks (i.e., ignores other requests) while it services that request (most of that time is taken up waiting for I/O resources to become available), then moves on to handle the next request. This limits a typical webserver's throughput. Node.js does <b>NOT</b> block while it handles requests which means it can handle many more per second; which makes it uniquely suited to handle many low-service, open-ended requests.

<a href="http://en.wikipedia.org/wiki/WebSocket">HTML5 WebSockets</a> use exactly that sort of low-service, open-ended requests to do their majik. <a href="http://www.xydo.com/">Xydo</a> specifically uses a <a href="http://en.wikipedia.org/wiki/Publish/subscribe">Pub/Sub</a> framework called <a href="https://github.com/jcoglan/faye">Faye</a> which utilizes both Node.js and WebSockets. Faye allows them to "publish" content from the servers to a given browser subscribed to that content, and the content "majikly" shows up in the user's web browser. For the record, <a href="https://github.com/jcoglan/faye">Faye</a> <b>does</b> degrade gracefully in <a href="http://en.wikipedia.org/wiki/Comparison_of_layout_engines_(HTML_5)#Related_specifications">browsers that do not support WebSockets</a> (by using JSONP or LongPolling) so you do not have to worry about excluding the slow-adopters (read: all Internet Explorer users).

So put the two together: <a href="http://www.xydo.com/">Xydo</a> creates a publishing channel for each user when the user signs in (something like <code>"/user/#{user_id}"</code>). The user's browser is the only subscriber to this channel. Whenever something of interest to the user happens, a message is published onto the user's channel which is then read to by the user's browser. In the use-case of a direct message sent by another user, at the same time that you are INSERTing the message into your database, you publish a message using Faye. In the use-case of a particular topic being updated, you would find (in your database) all users who subscribe to that topic, and publish multiple messages, one on each user's channel.

The final piece of the puzzle is formatting the messages to be published, for which Xydo uses <a href="https://github.com/defunkt/mustache">Mustache</a> (a template engine even more strict than HTML/ERB).

So that's it! <a href="http://nodejitsu.com/">Spin up some Node.js servers on a service like NodeJitsu</a>, use the <a href="https://github.com/jcoglan/faye">Faye rack plugin</a> in your rails application, and you can easily provide real-time, in-browser updates to your users <b>WITHOUT</b> overwhelming your servers. 
