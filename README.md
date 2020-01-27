# Subset sum solver #

This is the code repository for building a [heroku web app](http://subset-solver.herokuapp.com) to solve the [subset sum problem](https://en.wikipedia.org/wiki/Subset_sum_problem).

## Algorithm ##




## Implementation ##

The python implementation of subset sum algorithm is adopted from [stackoverflow](https://stackoverflow.com/questions/4632322/finding-all-possible-combinations-of-numbers-to-reach-a-given-sum).

To speed up the dynamic programming algorithm, I used [cython](https://cython.readthedocs.io/en/latest/src/quickstart/overview.html) to optimized a the code, a benchmark test can be found [here](https://github.com/wckdouglas/subset_sum/blob/master/benchmark/benchmark_cython.ipynb).

![](https://github.com/wckdouglas/subset_sum/blob/master/benchmark/timing.png?raw=true)

## Deployment ##

The flask app is hosted by [Heroku](https://heroku.com). The deployment is well documented on the website, codes can be push to heroku using [heroku cli](https://devcenter.heroku.com/articles/heroku-cli) and [git](https://devcenter.heroku.com/categories/deploying-with-git). I followed [this guide](https://pybit.es/deploy-flask-heroku.html).

Basically, after heroku cli is installed, do:

1. login, so you can access your data via cli
```
heroku login 
```

2. create the app, some [flask-specific requirments](https://exploreflask.com/en/latest/organizing.html)
   1. All javascripts and css files should go to a folder called [static](https://github.com/wckdouglas/subset_sum/tree/master/src/static),
      1. I put the [whole bootstraip library](https://getbootstrap.com/) into this folder
   2. All html templates should go to a folder called [templates](https://github.com/wckdouglas/subset_sum/tree/master/src/templates)

```
mkdir ~/subset_sum
cd ~/subset_sum
mkdir src src/templates src/static
# make some codes...
git init
```

3. Create a fresh new env, and install required packages
```
conda create -n subset_sum python=3.6 \
    cython flask    
```

4. Create ```requirement.txt``` so heroku knows what to install
```
pip freeze > requirements.txt
```

5. Commit all codes
```
git add .
git commit -m 'initialize web app'
```

6. Adding heroku git repo as an remote repo
```
heroku create subset-solver
```

7. Push the code to heroku
```
git push heroku master
```

8. And now you can see if the [webapp](http://subset-solver.herokuapp.com/) is live (hint: it's not, because heroku won't know how to do/need to do ```flask run``` to run the webapp)

9. To tell heroku how to start the app
```
echo 'web: gunicorn app:app' > Procfile
git add Procfile
git commit -m "Added Procfile and runtime.txt files"
git push heroku master
```

10. Open the webapp and see if it is what it should look like
```
heroku open
```

11. This should work if cython is not being used, because heroku doesn't compile cython code by default.. The installation of gcc was done following [a post on stackoverflow](https://stackoverflow.com/questions/51655018/how-to-host-cython-web-app-on-heroku).
    1.  Now, we need to do
    ```
    heroku update beta
    heroku plugins:install @heroku-cli/plugin-manifest
    heroku manifest:create
    ```
    2. This will create a ```heroku.yml``` file, so now you can delete the ```Procfile```
    3. Modify the ```heroku.yaml``` into:
    ```
    setup:
    config: {}
    build:
    languages:
        - python
    packages:
        - build-essential
    run:
    web: 'gunicorn app.app:app'
    ```
    4. And finally:
    ```
    heroku stack:set container
    git add heroku.yaml
    git commit -am 'added heroky.yml'
    git push heroku master
    ```
