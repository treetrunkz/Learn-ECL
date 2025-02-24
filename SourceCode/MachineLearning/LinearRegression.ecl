IMPORT ML_Core;
IMPORT ML_Core.Types;
IMPORT LinearRegression AS LROLS;

//Record structure of raw data
Layout := RECORD
  UNSIGNED4 id,
  UNSIGNED4 X,
  DECIMAL Y
END;

//Raw data
raw := DATASET([
                  {1, 24 , 21.54945196},
                  {2, 50 , 47.46446305},
                  {3, 15 , 17.21865634},
                  {4, 38 , 36.58639803},
                  {5, 87 , 87.28898389},
                  {6, 36 , 32.46387493},
                  {7, 12 , 10.78089683},
                  {8, 81 , 80.7633986},
                  {9, 25 , 24.61215147},
                  {10, 5 , 6.963319071},
                  {11, 16	, 11.23757338},
                  {12, 16	, 13.53290206},
                  {13, 24	, 24.60323899},
                  {14, 39	, 39.40049976},
                  {15, 54	, 48.43753838},
                  {16, 60	, 61.69900319},
                  {17, 26	, 26.92832418},
                  {18, 73 , 70.4052055},
                  {19, 29	, 29.34092408},
                  {20, 31	, 25.30895192}
                ],  Layout);
OUTPUT(raw, NAMED('raw'));

//Transform raw data to Machine Learning record structure NumericField
ML_Core.ToField(raw, NF);
OUTPUT(NF, NAMED('NF'));

// split data into input (X) and output (Y) variables
X := NF(number < 2);
Y := NF(number = 2);
OUTPUT(X, NAMED('X'));
OUTPUT(Y, NAMED('Y'));

//Training LinearRegression Model
lr := LROLS.OLS(X, Y);

//Prediction
predict := lr.predict(X);
ML_Core.FromField(predict, layout, result);
OUTPUT(result, NAMED('predictionResult'));

//Evaluate the prediction result by R2, MSE and RMSE
eval := ML_Core.Analysis.Regression.Accuracy(predict , y);
OUTPUT(eval, NAMED('Evaluation'));

