#Samantha Lee
#Neural network to square root data 
#Classification using backpropagation 
#Data gives the infertility details after spontaneous and induced abortions 

install.packages("datasets")
library("datasets")
install.packages("neuralnet")
library("neuralnet")
attach(infert)
infert <- infert
infert

#Generate 10 random numbers from the dataset
#Create the output as the square root of the input 

InfertInput <- sample(nrow(infert), 0.75*nrow(infert))
InfertOutput <- sqrt(InfertInput)

#Bind the data into one variable
InfertData <- cbind(InfertInput, InfertOutput)
colnames(InfertData) <- c("Input","Output")
InfertData

#Train the neural network
#Threshold represents an artificial neuron, makes decision based on the input it receives
#0.1 represents error function / stopping criteria
NetSqrt <- neuralnet(Output~Input, InfertData, hidden=10, threshold=0.01)
print(NetSqrt)

#Plot the neural network
plot(NetSqrt)

#Test the neural network on some training data
#Generate some squared numbers to run through network 
TestData <- as.data.frame((1:10)^2) 
NetResults <- compute(NetSqrt, TestData) 

#Returns names of the objects in the specified environment 
ls(NetResults)
print(NetResults$net.result)

#Print out a clean representation 
CleanOutput <- cbind(TestData,sqrt(TestData), as.data.frame(NetResults$net.result))
colnames(CleanOutput) <- c("Input","Expected Output","Neural Net Output")
print(CleanOutput)
