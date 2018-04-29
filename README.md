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

I know the way I've implemented search before was using MySQL's `LIKE` operator
but due to the given example I didn't think that would work well. After doing
some googling I discovered MySQL's full-text search functions could do the job.
First, the app searches for the exact string in the search term and if it doesn't
find a record, then it searches again using the full-text search function.  I
did this because I read the full-text search functions can be slow and, given a
large enough dataset, it would slow down searches for exact matches.

## improvements

1. The search could be improved by using a service such as ElasticSearch.

2. Return multiple results if more than one matches (for example 'jeans' matches
more than one product).

3. Add more search examples to the tests.

4. Fix the url for the 'washed chinos' product image.

5. Use React for the front-end so that it's easier to build upon later if necessary.

6. Style the front-end to make it more presentable.

## questions

1. "Inventory information should be grouped by product."

Is it supposed to return more than one product? It no, then what does this mean?

2. The washed chinos image is not resolving.

3. How much polish on Goal #3?

4. How many tests are expected?
