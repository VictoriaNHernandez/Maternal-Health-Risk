# 🤰 Maternal Health Risk Prediction Using Machine Learning

## 📋 Project Overview

This project applies supervised machine learning techniques to predict maternal health risk levels (Low, Mid, High) based on physiological indicators. The dataset, sourced from the UCI Machine Learning Repository, includes patient attributes such as age, blood pressure, blood glucose, body temperature, and heart rate.

## 🔍 Objective

To classify maternal health risk using:
- K-Nearest Neighbors (KNN)
- Naïve Bayes
- Decision Tree

Each model's performance is evaluated using accuracy, precision, recall, and F1 score metrics.

## 🗂 Dataset Summary

- **Source**: UCI Machine Learning Repository
- **Records**: 1,013
- **Features**: Age, SystolicBP, DiastolicBP, BS (Blood Sugar), BodyTemp, HeartRate
- **Target**: RiskLevel (Low, Mid, High)

## 🧪 Methods

- Exploratory Data Analysis (EDA): Mean, standard deviation, quartiles
- Data Preprocessing: Factor conversion, 70/30 train-test split
- Models: Trained using holdout method
  - **KNN**: Best overall balance across classes
  - **Naïve Bayes**: Best for Low Risk detection
  - **Decision Tree**: Most accurate for High Risk classification

## 📊 Key Findings

- **KNN**: Highest F1 for Mid Risk (0.5268), balanced performance
- **Naïve Bayes**: Highest recall (0.8678) and F1 (0.7368) for Low Risk
- **Decision Tree**: Highest recall (0.8889) and F1 (0.8182) for High Risk

## ⚠️ Limitations

- Limited feature scope may miss other key health predictors
- Data collected from rural Bangladesh may limit global generalization

## 🔭 Future Work

- Implement cross-validation for improved reliability
- Integrate more patient attributes for deeper insight

## 📚 References

- UCI Machine Learning Repository
- WHO reports on maternal health
- IBM and academic resources on classification algorithms

## 👩‍💻 Author

**Victoria Hernandez**  
