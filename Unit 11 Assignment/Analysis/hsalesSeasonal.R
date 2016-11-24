#Returns seasonally adjusted data constructed by removing the seasonal component.
fit <- stl(hsales, s.window=5)
plot(fit, main="Seasonal Adjusted Data",col="blue")

plot(hsales, col="gray",lwd=2, main="Sales of US Single Family Housing\nwith Seasonal Adjusted Data (red line)", ylab="New Single Family House Sales", xlab="Years")

lines(fit$time.series[,2],col="red",ylab="Trend",lwd=2.5)