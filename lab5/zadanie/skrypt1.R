# Drzewo decyzyjne rpart Iris

library(magrittr)
library(tidyverse)

data(iris)

library(rpart)
model <- rpart(Species ~., data = iris)
par(xpd = NA)
library(rpart.plot)
rpart.plot(model)


newdata <- data.frame(
  Sepal.Length = 6.5, Sepal.Width = 3.0,
  Petal.Length = 5.2, Petal.Width = 2.0
)
model %>% predict(newdata, "class") 