Google Analytics Page Views, etc to GeckoBoard Gateway
======================================================

Why?
----

[Geckoboard](http://www.geckoboard.com) already has its own Google Analytics widgets but they are limited in scope. We needed a raft of metrics over various time spans hence I wrote this Sinatra app to get the values and return them in the correct JSON format.

Uses
----

Makes use of the [Garb Gem](https://github.com/vigetlabs/garb)

Where?
------

The app is currently quietly chugging away on Heroku but its location is a secret because of the nature of the data it's processing.