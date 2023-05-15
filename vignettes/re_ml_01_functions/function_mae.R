mae <- numeric(length(k_values))
for (k in k_values) {
  # fit the model on training data
  model <- train(VPD_F ~ ., method = "knn", trControl = trainControl(method = "none"), tuneGrid = data.frame(k = k), data = train)
  
  #evaluation of the training data
  y_train_predicted <- predict(model, newdata = train)
  mae[k] <- mean(abs(y_train_predicted - train$VPD_F))
  
  #evaluation of the test data
  y_test_predicted <- predict(model, newdata = test)
  mae[k] <- mean(abs(y_test_predicted - test$VPD_F))
}