---
layout: post
title: Click & Long-Press Event Listeners in a ListActivity
tags:
- konreu
- tech
---
Listening for and handling click and long-press (a.k.a. long-click) events in an Android ListActivity is a a simple matter of defining <strong>setOnItemClickListener</strong> and <strong>setOnItemLongClickListener</strong> <em>delegate methods</em> in the <strong>ListView</strong>.

For individual list items to be clickable, you will want to let the <strong>ListActivity</strong>'s <strong>ListView</strong> handle the onItemClick and onItemLongClick events that Android fires when a user interacts with your application.

First, get your ListView from your ListActivity. The ListView will handle the click and long press Android events for your ListActivity.
[java]
ListView lv = getListView(); 
[/java]

Next, provide a method to handle the click when users press and release a list item in the ListView.
[java]
lv.setOnItemClickListener(new AdapterView.OnItemClickListener() {
    @Override 
    public void onItemClick(AdapterView&lt;?&gt; av, View v, int pos, long id) { 
        onListItemClick(v,pos,id); 
    }
});
[/java]

Define your method to handle the onItemClick. This accepts a View which is the individual UI element that was clicked. This View corresponds to your layout that you set in your Adapter for your ListActivity. The position corresponds to which list item was clicked in the ListView (starting with a 1-index).
[java]
protected void onListItemClick(View v, int pos, long id) {
    Log.i(TAG, &quot;onListItemClick id=&quot; + id);
}
[/java]

Handling long press events is essentially the same as handling clicks except that you return a boolean which specifies whether Android should continue to propagate the click event.
[java]
lv.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() { 
    @Override 
    public boolean onItemLongClick(AdapterView&lt;?&gt; av, View v, int pos, long id) { 
        return onLongListItemClick(v,pos,id);  
    } 
});
[/java]

If your long-click method returns <strong>true</strong> then you are telling Android that you handled the event and nobody else should know about the long-press. If your method returns <strong>false</strong>, Android will still call other handlers such as your onItemClick handler. Long-press events in Android typically do not perform the same action as a regular press, so it may be best to return <strong>true</strong> to stop event propagation.
[java]
protected boolean onLongListItemClick(View v, int pos, long id) { 
    Log.i(TAG, &quot;onLongListItemClick id=&quot; + id);
    return true;
}
[/java]

<h3>Outside This Scope</h3>
This is just the beginning for handling clicks within Android ListActivities and ListViews. Below are topics not covered within the scope of this post.
<ul>
<li>Performing actions within your onListItemClick such as starting a new Activity and sending information about the item that was clicked</li>
<li>Creating a custom context menu during your onLongListItemClick method</li>
<li>In Android SDK 1.6+, there is an easier way to attach click listeners to Views</li>
<li>You can set individual click listeners for Views within each list item to perform different actions depending on where you click within the list item</li>
</ul>

<h3>Resources</h3>
I did not come up with this out of my own brainz. I have only compiled and annotated information I have found online. The following resources may provide additional, useful information.
<ul>
<li>	Android Developers Google Group - <a href="http://groups.google.com/group/android-developers/browse_thread/thread/14ba131c3ebc49eb">Long click on list activity item</a></li>
<li>7touch Group Blog - <a href="http://blog.7touchgroup.com/tag/android-list-item-click-listener/">Android List Item Click Listener</a> (scroll down to the "Easier click listeners" section)</li>
</ul>
