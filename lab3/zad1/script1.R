# Wariant 1

library("neuralnet")

#Going to create a neural network to perform this function
my_function <- function(x) {
  result <- x^3 + 2 * x
}


#And store values of x as a dataframe
traininginput <-  as.data.frame(round(runif(50, min=0, max=100)))
trainingoutput <- my_function(traininginput)

#Column bind the data into one variable
trainingdata <- cbind(traininginput,trainingoutput)
colnames(trainingdata) <- c("x","y")

# Maybe i should scale

maxs <- apply(trainingdata, 2, max) 
mins <- apply(trainingdata, 2, min)

trainingdata <- as.data.frame(scale(trainingdata[,1:2], center = mins, scale = maxs-mins))

#Train the neural network
#Going to have 10 hidden layers

# y~I(x^3 + 2*x) nie dziala


net.myfunction <- neuralnet(y~x, trainingdata, hidden=c(10, 10, 10), threshold=0.01)
print(net.myfunction)

#Plot the neural network
plot(net.myfunction)

#Test the neural network on some training data
testdata <- as.data.frame(1:10) 
net.results <- compute(net.myfunction, testdata) #Run them through the neural network

#Lets see what properties net.sqrt has
ls(net.results)

#Lets see the results
print(net.results$net.result)

#Lets display a better version of the results
cleanoutput <- cbind(testdata,my_function(testdata),
                     as.data.frame(net.results$net.result))
colnames(cleanoutput) <- c("Input","Expected Output","Neural Net Output")
print(cleanoutput)