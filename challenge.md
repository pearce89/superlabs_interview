# Task: Build an online reviews website #

**Note** _ Please spend about 5 hours or less on this project.  We don't expect you to come close to finishing this; instead, we are looking to see how you implement features. _

Implement a Rails application that allows users to review movies.  After logging in, a user should be able to leave a review of 1-10 on that movie, and an optional comment.  Reviews are displayed on a movie's page as a list on chronological order.

You'll need to import some movies for users to review.  In this project you'll find a CSV of recent movies: [recent_movies.csv](https://github.com/superlabs/interview/blob/master/recent_movies.csv)

For the stack, please use Rails 5 + jQuery + Neo4j.  For Rails, I would highly recommend you use Devise + Devise-neo4j + Neo4jrb + Turbolinks.

If you feel the need to try for some extra functionality, here is a list of nice-to-have features:

* Comments on reviews - If you see a review you can subcomment and have a conversation with the review's author.
* Geolocate the user when they are signing up so we know where they are from.
* Sharing - Ability to share a review on Facebook + Twitter
* User scores - For each comment a user receives, they get 1 point.  When viewing comments on a movie page, a user's score should be listed next to their name.
* Reviews are votable, and each review gets a score based on the number of upvotes it receives.
* Popularity - Based on a movie's aggregate rating from the reviews it receives, create a scope that will return it's popularity.  An excellent post on a good Ruby algorithm for this is http://www.evanmiller.org/how-not-to-sort-by-average-rating.html