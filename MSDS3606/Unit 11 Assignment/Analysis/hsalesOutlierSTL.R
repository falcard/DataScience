# Step G-1: Plot Seasonal Adjusted Data with Outlier at End:
fit4 <- stl(hsales4, s.window=5)
plot(fit4, col="blue",main="Seasonal Adjusted Data\n(Outlier Close to End)")

# Plot of hsales4 with the seasonal adjusted data(purple line), fit3
plot(hsales4, col="gray",lwd=2,main="Sales of US Single Family Housing(Outlier Clost to End)
\nwith Seasonal Adjusted Data (purple line)",
ylab="New Single Family House Sales", xlab="Years")
lines(fit4$time.series[,2],col="purple",ylab="Trend",lwd=2.5)