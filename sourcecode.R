# Install and load required libraries
install.packages("tidyverse")
install.packages("caret")
install.packages("rpart")
install.packages("ggplot2")
install.packages("caret")
install.packages("rpart.plot")


library(rpart.plot)
library(tidyverse)
library(caret)
library(rpart)
library(ggplot2)

#load the dataset
df <- read.csv("loan_prediction_data.csv")

# View structure and summary
str(df)
summary(df)


#Chi-Square Test: Credit History vs Loan Status
chisq.test(table(df$Credit_History, df$Loan_Status))

#Check if loan approval is independent of credit --chi- square test
chisq.test(table(df$Education, df$Loan_Status))

#T-Test: Applicant Income vs Loan Status
# Convert Loan_Status to numeric group
df$Loan_Status_Num <- ifelse(df$Loan_Status == "Y", 1, 0)

# t-test for applicant income
t.test(ApplicantIncome ~ Loan_Status, data = df)

#T-Test: Loan Amount vs Loan Status
t.test(LoanAmount ~ Loan_Status, data = df)

# Convert categorical variables to factors
factor_cols <- c("Gender", "Married", "Dependents", "Education",
                 "Self_Employed", "Credit_History", "Property_Area", "Loan_Status")
df[factor_cols] <- lapply(df[factor_cols], as.factor)

# Train-test split
set.seed(42)
splitIndex <- createDataPartition(df$Loan_Status, p = 0.8, list = FALSE)
trainData <- df[splitIndex, ]
testData <- df[-splitIndex, ]

# 1. Decision Tree
model_dt <- train(Loan_Status ~ ., data = trainData, method = "rpart")
pred_dt <- predict(model_dt, testData)
acc_dt <- confusionMatrix(pred_dt, testData$Loan_Status)

# View model summary
print(model_dt)
predictions <- predict(model_dt, newdata = testData)

# Confusion Matrix
confusionMatrix(predictions, testData$Loan_Status)

# Print results
acc_dt$overall["Accuracy"]

# If you used caret:
model_dt_final <- model_dt$finalModel
# Basic tree plot
rpart.plot(model_dt_final)



rpart.plot(
  model_dt,
  type = 3,              # Boxed labels
  extra = 104,           # Show class & probability & % of obs
  fallen.leaves = TRUE,  # Nodes at the bottom
  main = "Decision Tree for Loan Approval Prediction",
  tweak = 1.2,
  under = TRUE
)


new_applicant <- data.frame(
  Gender = factor("Male", levels = levels(df$Gender)),
  Married = factor("Yes", levels = levels(df$Married)),
  Dependents = factor("1", levels = levels(df$Dependents)),
  Education = factor("Graduate", levels = levels(df$Education)),
  Self_Employed = factor("No", levels = levels(df$Self_Employed)),
  ApplicantIncome = 5000,
  CoapplicantIncome = 1500,
  LoanAmount = 150,
  Loan_Amount_Term = 360,
  Credit_History = factor(1, levels = levels(df$Credit_History)),
  Property_Area = factor("Urban", levels = levels(df$Property_Area))
)

prediction <- predict(model_dt, new_applicant, type = "raw")
print(prediction)