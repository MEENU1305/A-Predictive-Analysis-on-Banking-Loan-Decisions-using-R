# A-Predictive-Analysis-on-Banking-Loan-Decisions-using-R
Dataset Overview

The dataset contains 1,000 entries simulating banking loan applications. The goal is to predict whether a loan will be approved based on features such as credit history, income, education, and employment status.

 Variables Used:

Categorical: Gender, Married, Dependents, Education, Self_Employed, Credit_History, Property_Area, Loan_Status

Numerical: ApplicantIncome, CoapplicantIncome, LoanAmount, Loan_Amount_Term
 Statistical Testing

Chi-Square Tests (Categorical Associations):The Chi-Square Test is a statistical hypothesis test used to determine whether there is a significant association between two categorical variables. It compares the observed frequencies in each category to the expected frequencies if the variables were independent.


Hypotheses for Test of Independence:
Null Hypothesis (H₀): The two variables are independent (no association).

Alternative Hypothesis (H₁): The two variables are dependent (there is an association).

Decision Rule:
If p-value < 0.05 → Reject H₀ → Variables are associated

If p-value ≥ 0.05 → Fail to reject H₀ → Variables are independent

Credit_History vs Loan_Status: It results in highly significant (p < 0.001)

Interpretation: Applicants with good credit history are more likely to have their loans approved.

Education vs Loan_Status: Not significant (p > 0.05)

Interpretation: Education does not significantly influence loan approval.

T-Tests (Numerical Mean Differences):A T-Test is a statistical hypothesis test used to determine whether there is a significant difference between the means of two groups. It is commonly used when the data is numerical and the sample size is small to moderate.

ApplicantIncome vs Loan_Status:

Result: Significant (p < 0.05)

Interpretation: Higher applicant income correlates with higher approval chance.

LoanAmount vs Loan_Status:

Result: Significant (p < 0.05)

Interpretation: Larger loan amounts are slightly less likely to be approved.

Machine Learning Models

Decision Tree (rpart):A Decision Tree is a supervised machine learning algorithm used for classification and regression tasks. It models decisions as a tree-like structure of if-else conditions that split data based on feature values.

Trained with: caret package

Test Accuracy: ~Accuracy from confusionMatrix

Key Features: Credit_History, LoanAmount, ApplicantIncome

Visualization:

A decision tree was plotted using rpart.plot() with node probabilities, sample sizes, and split rules. The tree starts with Credit_History and branches out to other influential features.

Prediction Example

A sample new applicant with the following features:

Male, Married

1 Dependent

Graduate

Not Self-Employed

ApplicantIncome: 5000

CoapplicantIncome: 1500

LoanAmount: 150

Term: 360

Good Credit History

Urban Area

Predicted Loan Status: Y (Approved)

Correlation Analysis

A heatmap of numeric features (Income, LoanAmount, etc.) shows:

Moderate positive correlation between ApplicantIncome and LoanAmount.

Very weak or no correlation between CoapplicantIncome and Loan_Status.

Conclusion

This project demonstrates the use of statistical testing and machine learning (decision tree) to predict loan approval using R language. Credit history and income are significant predictors. The model built using the rpart decision tree algorithm performs well and is easy to interpret, making it suitable for banking decision support systems.
