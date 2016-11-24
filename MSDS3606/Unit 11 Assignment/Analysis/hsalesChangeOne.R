#start year=1973, frequency= 12 months
hsales2 <- ts(c(hsales[1:137],hsales[138]+500,hsales[139:275]),start=c(1973,1),frequency=12)
plot(hsales2, col="purple",lwd=1.5, main="Sales of US One Family Housing\n(Outlier in Middle)",
     ylab="New Single Family House Sales", xlab="Years")

# Recompute the seasonally adjusted data
 fit2 <- stl(hsales2, s.window=5)
plot(fit2, col="brown",lwd=1.5, main="Seasonal Adjusted Data\n(Outlier in Middle)")

# Plot of hsales2 with the seasonally adjusted data (green line)
plot(hsales2, col="gray", lwd=1.5,
     main="Sales of US Single Family Housing(Outlier in Middle)\nwith Seasonal Adjusted Data(green line)",
     ylab="New Single Family House Sales", xlab="Years")
lines(fit2$time.series[,2],col="green",lwd=1.5, ylab="Trend")