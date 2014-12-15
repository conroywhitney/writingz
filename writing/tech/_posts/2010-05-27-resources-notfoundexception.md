---
layout: post
title: Resources NotFoundException
tags:
- konreu
- tech
---
The below Resources$NotFoundException log results from user error and is easily fixed.

[bash wraplines="false" highlight="2"]
Uncaught handler: thread main exiting due to uncaught exception
android.content.res.Resources$NotFoundException: String resource ID #0x1
at android.content.res.Resources.getText(Resources.java:205)
at android.widget.TextView.setText(TextView.java:2809)
[/bash]

I get this error when I am trying to set a View's text using an integer value like:

[java]
view.setText(iSomeInteger) // This is incorrect !
[/java]

Instead, to set the text of a view using an integer, you need to do:

[java]
view.setText(Integer.toString(iSomeInteger)) // setText with an int
[/java]

The problem is that <code>setText(int)</code> is reserved for string resource ids, like:

[java]
view.setText(R.string.someStringId) // setText with a string resource id
[/java]

The last part of this puzzle is when you want to concatenate a string resource with other text, you need to use getString(int). Otherwise you will end up with the string resource id (not the string itself) as part of your new text:

[java]
// concatenate a string with a string resource
view.setText(&quot;Some Text: &quot; + getString(R.string.someStringId)) 
[/java]
