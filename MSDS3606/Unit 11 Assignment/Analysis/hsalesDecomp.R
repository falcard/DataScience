##b.) Use a classical decomposition to calculate the trend-cycle and seasonal indices.

#Decompose a time series into seasonal, trend and irregular 
#components using moving averages.
data <- decompose(hsales)

# Plot the estimated trend, seasonal, and irregular components
plot(data, col="blue")