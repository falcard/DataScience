# F-1 Step 1: Create an outlier near the end:
hsales4 <- ts(c(hsales[1:260],hsales[261]+500, hsales[262:275]),start=c(1973,1),frequency=12)

# Plot the time series:
plot(hsales4, lwd=1.5, col="orange",main="Sales of US One Family Housing\n(Outlier Close to End)",
     ylab="New Single Family House Sales", xlab="Years")