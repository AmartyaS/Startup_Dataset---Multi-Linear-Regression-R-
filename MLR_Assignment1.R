install.packages("MASS")
install.packages("psych")
install.packages("car")
library("car")
library("MASS")
library("psych")
data <- read.csv(file.choose())
View(data)
pairs.panels(data)
new <- data[,-4]
View(new)
pairs.panels(new)
plot(new)
attach(new)
model <- lm(Profit~.,data=new[-50,])
model_new <- lm(Profit~R.D.Spend+Marketing.Spend+Administration,data = new)
summary(model_new)
confint(model,level=0.95)
pred <- predict(model,interval = "predict")
pred
stepAIC(model)
vif(model)
avPlots(model,id.n=5,id.cex=0.9,col="red")
plot(model)
Pred <- as.data.frame(pred)
Prediction <- Pred$fit
New_data <- cbind(new,Prediction)
Prediction$fit
Pred
