<!-- README.md is generated from README.Rmd. Please edit that file -->
**NOTE: This is a toy package created for expository purposes. It is not meant to actually be useful. If you want a package for factor handling, please see [forcats](https://cran.r-project.org/package=forcats).**

I'm trying to fix Error: 'rcmd\_safe\_env' is not an exported object from 'namespace:callr'

***Refresher:*** when a character is converted into a factor, levels are ordered by defaul unless specified. Levels are unique categorical values, therefore, if the vector has already unique categorical values, it does not need to be converted into a factor and can remain as character. the two function i wrote will help you assess whether a vector should be character of factor, and to return a vector with unordered levels.

### foofactors

Factors are a very useful type of variable in R, but they can also drive you nuts. This package provides some helper functions for the care and feeding of factors.

### Installation

``` r
devtools::install_github("jennybc/foofactors")
```

### Quick demo

Binding two factors via `fbind()`:

``` r
library(foofactors)
a <- factor(c("character", "hits", "your", "eyeballs"))
b <- factor(c("but", "integer", "where it", "counts"))
```

Simply catenating two factors leads to a result that most don't expect.

``` r
c(a, b)
#> [1] 1 3 4 2 1 3 4 2
```

The `fbind()` function glues two factors together and returns factor.

``` r
fbind(a, b)
#> [1] character hits      your      eyeballs  but       integer   where it 
#> [8] counts   
#> Levels: but character counts eyeballs hits integer where it your
```

Often we want a table of frequencies for the levels of a factor. The base `table()` function returns an object of class `table`, which can be inconvenient for downstream work. Processing with `as.data.frame()` can be helpful but it's a bit clunky.

``` r
set.seed(1234)
x <- factor(sample(letters[1:5], size = 100, replace = TRUE))
table(x)
#> x
#>  a  b  c  d  e 
#> 25 26 17 17 15
as.data.frame(table(x))
#>   x Freq
#> 1 a   25
#> 2 b   26
#> 3 c   17
#> 4 d   17
#> 5 e   15
```

The `freq_out()` function returns a frequency table as a well-named `tbl_df`:

``` r
freq_out(x)
#> # A tibble: 5 x 2
#>        x     n
#>   <fctr> <int>
#> 1      a    25
#> 2      b    26
#> 3      c    17
#> 4      d    17
#> 5      e    15
```

### as is levels

as is levels returns a factor with levels in their original order

Example:

``` r
## regular factor
pollo <- c("rooster", "chicken", "hen")
factor(pollo)
#> [1] rooster chicken hen    
#> Levels: chicken hen rooster
## levels as is
as_is_levels<- function (x) {
                factor(x, levels= unique(x))}
  
as_is_levels(pollo)
#> [1] rooster chicken hen    
#> Levels: rooster chicken hen
```

### Character or factor

character or factor compares the lenght of levels with the leght of the factor, if equal, it suggest it should be character, if not, factor.

Example:

``` r
### repeated levels
pollos<- c("gallo", "gallo", "pollito", "gallina", "pollito")
char_not_fact(pollos)
#> [1] "it should be a factor"

### unique levels
char_not_fact<- function (x) {f<- as_is_levels(x)
if (length(f)== length(unique(levels(f)))) {
  return("that should be character")}

else {return("it should be a factor")
}
}
pollo <- c("rooster", "chicken", "hen")
char_not_fact(pollo)
#> [1] "that should be character"
```
