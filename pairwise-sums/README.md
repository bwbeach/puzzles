# Problem Statement

I found [this problem](https://blog.tanyakhovanova.com/2022/11/yumsh-olympiad/) on a Mastodon post, but have lost the source.  Sorry.

```
Bob was given 30 distinct natural numbers. He wrote down all the 435 pairwise sums.
It appears that among those sums, 230 are divisible by 3.
How many of the original 30 numbers are divisible by 3?
```

# Solution

I haven't found a nice closed-form solution.  I built a Jupyter notebook to draw
the shape of the space to search for answers, which made it clear that there
is exactly one answer to the problem as stated, but that there may be many
or no answers to the same problem with a target number other than 230.
