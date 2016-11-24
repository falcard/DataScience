# Unit 11 Assignment
Angela Horacek, James Logan Gage, Trace Smith  
November 22, 2016  
# Introduction

- Data set "elecequip" shows the number of new orders for electrical equipment (computer, electronic and optical products) in the Euro area (16 countries). The data for this assignment is loaded from the 'Forecasting: principles and practice' (i.e. fpp) library. The source for the data 'hsales' which is the monthly sales of new one-family houses sold in the USA since 1973 is from: "Makridakis, Wheelwright and Hyndman (1998) Forecasting: methods and applications, John Wiley & Sons: New York. Chapter 3."



#### a) Plot the time series. Can you identify seasonal fluctuations and/or a trend?


```r
source("Analysis/hsalesPlot.R", echo=TRUE)
```

```
## 
## > plot(hsales, col = "red", lwd = 1.5, ylab = "Monthly Sales", 
## +     xlab = "Date", main = "Monthly Sales of \n 1-Family Houses in USA since 1973")
```

![Figure2](https://github.com/falcard/DataScience/blob/master/Unit%2011%20Assignment/Papers/Report_files/figure-html/unnamed-chunk-2-1.png)

- There appears to be a seasonality to the data. The data seem to be oscillating up and down corresponding to the calender year. In addition, a trend in the form of a sinusodal wave appears with a trough.

#### b) Use a classical decomposition to calculate the trend-cycle and seasonal indices.


```r
source("Analysis/hsalesDecomp.R", echo=TRUE)
```

```
## 
## > data <- decompose(hsales)
## 
## > plot(data, col = "blue")
```

![Figure3](https://github.com/falcard/DataScience/blob/master/Unit%2011%20Assignment/Papers/Report_files/figure-html/unnamed-chunk-3-1.png)

- The seasonal looks to cycle every calandar year and the trend-cycle is close to a 10 year cycle.

#### c) Do the results support the graphical interpretation from part (a)?

- The results from the decomposition graphics indicate there is not only a seasonal component but also a trend component bolstering the interpretation of the original graph.

#### d) Compute and plot the seasonally adjusted data.
 
- Decompose a time series into seasonal, trend and irregular components using:
 

```r
source("Analysis/hsalesSeasonal.R", echo=TRUE)
```

```
## 
## > fit <- stl(hsales, s.window = 5)
## 
## > plot(fit, main = "Seasonal Adjusted Data", col = "blue")
```

![Figure4](https://github.com/falcard/DataScience/blob/master/Unit%2011%20Assignment/Papers/Report_files/figure-html/unnamed-chunk-4-1.png)

```
## 
## > plot(hsales, col = "gray", lwd = 2, main = "Sales of US Single Family Housing\nwith Seasonal Adjusted Data (red line)", 
## +     ylab = "New Single Fa ..." ... [TRUNCATED]
```

![](Papers\Report_files/figure-html/unnamed-chunk-4-2.png)<!-- -->

```
## 
## > lines(fit$time.series[, 2], col = "red", ylab = "Trend", 
## +     lwd = 2.5)
```

#### e) Change one observation to be an outlier (e.g., add 500 to one observation), and recompute the seasonally adjusted data. What is the effect of the outlier?


```r
source("Analysis/hsalesChangeOne.R", echo=TRUE)
```

```
## 
## > hsales2 <- ts(c(hsales[1:137], hsales[138] + 500, 
## +     hsales[139:275]), start = c(1973, 1), frequency = 12)
## 
## > plot(hsales2, col = "purple", lwd = 1.5, main = "Sales of US One Family Housing\n(Outlier in Middle)", 
## +     ylab = "New Single Family House Sales" .... [TRUNCATED]
```

![Figure5](https://github.com/falcard/DataScience/blob/master/Unit%2011%20Assignment/Papers/Report_files/figure-html/unnamed-chunk-5-1.png)

```
## 
## > fit2 <- stl(hsales2, s.window = 5)
## 
## > plot(fit2, col = "brown", lwd = 1.5, main = "Seasonal Adjusted Data\n(Outlier in Middle)")
```

![Figure52](https://github.com/falcard/DataScience/blob/master/Unit%2011%20Assignment/Papers/Report_files/figure-html/unnamed-chunk-5-2.png)

```
## 
## > plot(hsales2, col = "gray", lwd = 1.5, main = "Sales of US Single Family Housing(Outlier in Middle)\nwith Seasonal Adjusted Data(green line)", 
## +    .... [TRUNCATED]
```

![Figure53(https://github.com/falcard/DataScience/blob/master/Unit%2011%20Assignment/Papers/Report_files/figure-html/unnamed-chunk-5-3.png)

```
## 
## > lines(fit2$time.series[, 2], col = "green", lwd = 1.5, 
## +     ylab = "Trend")
```

- The outlier observation in the middle of the data increases the magnitude of the the seasonally adjusted data not only at that particular time but also on both sides of that time. Similarly, the trend line also peaks at that year pulling the trend curve up around that time distorting the sinusodial wave pattern.

#### f) Does it make any difference if the outlier is near the end rather than in the middle of the time series?


```r
source("Analysis/hsalesOutlierEnd.R", echo=TRUE)
```

```
## 
## > hsales4 <- ts(c(hsales[1:260], hsales[261] + 500, 
## +     hsales[262:275]), start = c(1973, 1), frequency = 12)
## 
## > plot(hsales4, lwd = 1.5, col = "orange", main = "Sales of US One Family Housing\n(Outlier Close to End)", 
## +     ylab = "New Single Family House Sal ..." ... [TRUNCATED]
```

![Figure6](https://github.com/falcard/DataScience/blob/master/Unit%2011%20Assignment/Papers/Report_files/figure-html/unnamed-chunk-6-1.png)

- The outlier observation near the end of the data increases the magnitude of the the seasonally adjusted data not only at that particular time but also on both sides of that time; This is the same effect of the outlier in the middle except at a different time. Similarly, the trend line also peaks at that year pulling the trend curve up around that time distorting the sinusodial wave pattern.

#### g) Now use STL to decompose the series.


```r
source("Analysis/hsalesOutlierSTL.R", echo=TRUE)
```

```
## 
## > fit4 <- stl(hsales4, s.window = 5)
## 
## > plot(fit4, col = "blue", main = "Seasonal Adjusted Data\n(Outlier Close to End)")
```

![Figure7](https://github.com/falcard/DataScience/blob/master/Unit%2011%20Assignment/Papers/Report_files/figure-html/unnamed-chunk-7-1.png)

```
## 
## > plot(hsales4, col = "gray", lwd = 2, main = "Sales of US Single Family Housing(Outlier Clost to End)\n\nwith Seasonal Adjusted Data (purple line)",  .... [TRUNCATED]
```

![Figure72](https://github.com/falcard/DataScience/blob/master/Unit%2011%20Assignment/Papers/Report_files/figure-html/unnamed-chunk-7-2.png)

```
## 
## > lines(fit4$time.series[, 2], col = "purple", ylab = "Trend", 
## +     lwd = 2.5)
```


