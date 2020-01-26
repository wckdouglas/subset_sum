# Subset sum solver #

This is the code repository for building a [heroku web app](http://subset-solver.herokuapp.com) to solve the [subset sum problem](https://en.wikipedia.org/wiki/Subset_sum_problem).

## Algorithm ##



## Implementation ##

The python implementation of subset sum algorithm is adopted from [stackoverflow](https://stackoverflow.com/questions/4632322/finding-all-possible-combinations-of-numbers-to-reach-a-given-sum).

## Deployment ##

To speed up the dynamic programming algorithm, I used [cython](https://cython.readthedocs.io/en/latest/src/quickstart/overview.html) to optimized a the code, a benchmark test can be found [here](https://github.com/wckdouglas/subset_sum/blob/master/benchmark/benchmark_cython.ipynb).

![](https://github.com/wckdouglas/subset_sum/blob/master/benchmark/timing.png?raw=true)