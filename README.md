
<!-- README.md is generated from README.Rmd. Please edit that file -->

# inspiRe

This package is inspired by the `praise` package and StumbleUpon. The
goal is to give you some inspiration as you prepare to tell a story with
data by providing you with a random URL of someone else doing the same.
The motivation for this package is also to tie into the [Data Science by
Design](http://datasciencebydesign.org/) initiative. We want to have a
community-contributed list of things that inspire us to be creative as
we share our data work with the world.

**How to install:**

You can install inspiRe from GitHub:

``` r
# install.packages("remotes")
remotes::install_github("sastoudt/inspiRe")
```

**Usage:**

Simply load the package and ask R to inspire you! The `inspire_me()`
function will return a link that you can explore.

``` r
library(inspiRe)

inspire_me()
#> [1] "https://nautil.us/blog/you-want-to-see-my-data-i-thought-we-were-friends"
```

If you’re looking for something in particular, you can filter the
inspiration using the `author`, `affiliation`, `topic`, or `type`
arguments!

``` r
inspire_me(type = "data visualization")
#> [1] "http://www.rebeccabarter.com/blog/2019-01-21_world_happiness/"
```

To have the URL automatically open in your browser, set `open = TRUE`:

``` r
inspire_me(open = TRUE)
```

**How to contribute:**

1.  Fork this repo and clone it to your computer.
2.  Make changes. These could include adding pieces of inspiration to
    inst/extdata/links.csv or proposing functionality upgrades.
3.  Commit and push your changes.
4.  Create a pull request.

More details about this workflow can be found
[here](https://guides.github.com/activities/forking/#making-a-pull-request).
Reach out if you get stuck!

**Have ideas but not familiar with Github?**

If you want to contribute links for inspiration but do not feel
comfortable doing so via this process, add an issue with the link. We’ll
periodically go through and add them in (or another contributor will do
it for us!).
