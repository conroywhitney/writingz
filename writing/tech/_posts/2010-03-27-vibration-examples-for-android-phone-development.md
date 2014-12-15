---
layout: post
title: Vibration Examples for Android Phone Development
tags:
- konreu
- tech
---
Making Android phones vibrate is a good way to provide <a title="Haptic Technology on Wikipedia.org" href="http://en.wikipedia.org/wiki/Haptic_technology">haptic feedback</a> to users or to interact with users even when phone volume is low. This can ensure a better user experience and therefore increase the perceived integrity of your Android application.

The <a title="Android Vibrator Documentation" href="http://developer.android.com/reference/android/os/Vibrator.html">Vibrator Documentation</a> describes the interface for making an Android phone vibrate. With this interface, you can cause an Android phone to vibrate in one of the following ways:
<ol>
	<li>Vibrate for a given length of time</li>
	<li>Vibrate in a given pattern</li>
	<li>Vibrate repeatedly until cancelled</li>
</ol>
Below are examples of these three vibrating methods.
<h3>IMPORTANT: First, Grant Vibration Permissions</h3>
Before you start adding the code necessary to cause your application to vibrate, you must first notify Android that your application expects to have permission to use the Vibrator. If you do not do this, you will receive a Force Close. Nobody likes encountering a Force Close; Do not forget this important first step!

Add the <code>uses-permission</code> line to your <code>Manifest.xml</code> file, outside of the  block.
[xml highlight="2"]
&lt;manifest xmlns:android=&quot;http://schemas.android.com/apk/res/android&quot; package=&quot;...&quot;&gt;
	&lt;uses-permission android:name=&quot;android.permission.VIBRATE&quot;/&gt;
	&lt;application android:label=&quot;...&quot;&gt;
		...
	&lt;/application&gt;
&lt;/manifest&gt;
[/xml]

<h3>Example: Vibrate for a Given Length of Time</h3>
This example is useful when a user touches your application and you would like to provide haptic feedback. This is the simplest method of vibration. I like <em>50 milliseconds</em> as a good single-touch-feedback vibrate. You can experiment with different lengths (on your physical phone) to decide how long to make your vibration.

<span class="cuidado">CUIDADO: This code must be called with a reference to a Context</span>
[java highlight="5"]
// Get instance of Vibrator from current Context
Vibrator v = (Vibrator) getSystemService(Context.VIBRATOR_SERVICE);

// Vibrate for 300 milliseconds
v.vibrate(300);
[/java]

<h3>Example: Vibrate in a Given Pattern</h3>
This method of vibration is useful when you need to provide a user with a one-time notification, such as receiving a text message. In this example, I have created a one-time vibration notification in the <a title="Morse Code on Wikipedia.org" href="http://en.wikipedia.org/wiki/Morse_code">Morse Code</a> <a title="SOS on Wikipedia.org" href="http://en.wikipedia.org/wiki/SOS">SOS</a> pattern.

<span class="cuidado">CUIDADO: This code must be called with a reference to a Context</span>
[java highlight="24"]
// Get instance of Vibrator from current Context
Vibrator v = (Vibrator) getSystemService(Context.VIBRATOR_SERVICE);

// This example will cause the phone to vibrate &quot;SOS&quot; in Morse Code
// In Morse Code, &quot;s&quot; = &quot;dot-dot-dot&quot;, &quot;o&quot; = &quot;dash-dash-dash&quot;
// There are pauses to separate dots/dashes, letters, and words
// The following numbers represent millisecond lengths
int dot = 200;		// Length of a Morse Code &quot;dot&quot; in milliseconds
int dash = 500;		// Length of a Morse Code &quot;dash&quot; in milliseconds
int short_gap = 200;	// Length of Gap Between dots/dashes
int medium_gap = 500;	// Length of Gap Between Letters
int long_gap = 1000;	// Length of Gap Between Words
long[] pattern = {
	0, 	// Start immediately
	dot, short_gap, dot, short_gap, dot, 	// s
	medium_gap,
	dash, short_gap, dash, short_gap, dash, // o
	medium_gap,
	dot, short_gap, dot, short_gap, dot, 	// s
	long_gap
};

// Only perform this pattern one time (-1 means &quot;do not repeat&quot;)
v.vibrate(pattern, -1);
[/java]
<h3>Example: Vibrate Repeatedly Until Cancelled</h3>
This method of vibration is useful when you need to notify the user of something that requires more immediate action, such as an incoming phone call. You can repeat a given pattern until the Vibrator is cancelled, either by the system or manually by your Android application.

<span class="cuidado">CUIDADO: The below example will cease vibrating when the screen times out.</span>
<span class="cuidado">CUIDADO: This code must be called with a reference to a Context</span>
[java highlight="12"]
// Get instance of Vibrator from current Context
Vibrator v = (Vibrator) getSystemService(Context.VIBRATOR_SERVICE);

// Start immediately
// Vibrate for 200 milliseconds
// Sleep for 500 milliseconds
long[] pattern = { 0, 200, 500 };

// The &quot;0&quot; means to repeat the pattern starting at the beginning
// CUIDADO: If you start at the wrong index (e.g., 1) then your pattern will be off --
// You will vibrate for your pause times and pause for your vibrate times !
v.vibrate(pattern, 0);
[/java]
In another part of your code, you can handle turning off the vibrator as shown below:
[java]
// Stop the Vibrator in the middle of whatever it is doing
// CUIDADO: Do *not* do this immediately after calling .vibrate().
// Otherwise, it may not have time to even begin vibrating!
v.cancel();
[/java]
<h3>Notes</h3>
This article only covers a subset of issues related to Vibration on the Android platform but it should provide a good starting point. Below are a few things I have noticed but did not cover in this write-up. I would appreciate comments about these, if you have any:
<ul>
	<li>From what I have read, there is unfortunately no way of changing the vibration intensity.</li>
	<li>I did not research or discuss how to make phone vibrate despite the screen timeout.</li>
	<li>I have not seen the Vibrator log its activities in LogCat which makes it difficult to tweak vibration.</li>
	<li>As a result, I test vibration directly on my phone which requires exporting and installing my application on my physical phone. Tedious at best.</li>
</ul>
<h3>Reference Material</h3>
<ul>
	<li><cite><a title="Android Vibrator Documentation" href="http://developer.android.com/reference/android/os/Vibrator.html">Android Developer Documentation - Vibrator</a></cite></li>
	<li><cite><a title="Vibrate the phone for a given time or a certain pattern" href="http://www.androidsnippets.org/snippets/22/">Android Snippets - Vibrate the phone for a given time or a certain pattern</a></cite></li>
</ul>
