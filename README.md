## instructions

Make sure you have MySQL installed.

In `/` directory:

    rails db:setup
    rails s

In `/web` directory:

    npm install
    npm start

Visit `localhost:3001`

## approach

In order to return correct results from a search query such as `washed chimp` I
used MySQL's full-text search function `MATCH...AGAINST`.  This worked ok for
that search term, but for a term such as `travel jeans`, which should be
an exact match, I was getting results for `jetsetter jeans` as well.  To account
for this, I first search the database for the exact query in the search input
and if no results are found, then I search the database again using the
`MATCH...AGAINST` function.  This gives me the correct results when searching
for an exact match as well as similar results when only 1 word in the search term
matches.  Next, I split the search term and used MySQL's `LIKE` operator and `%`
wildcard to match any partial words, such as `wash` or even `wash chi`.

## improvements

1. Use a gem for the search functionality

2. Find a way to only hit the database once
