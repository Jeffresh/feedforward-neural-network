clear 
load('wine_dataset_clean.mat')

X = wine_dataset_clean(:,2:end);
y = wine_dataset_clean(:,1);

hidden_layers = [20]
[thetas, topology] = createTopology(X, hidden_layers, y);

nn_thetas = unrollThetas(thetas);
learning_rate = 0.06

for i=1:1000
  [J, grad, thetas] = nnCostFunction(nn_thetas, topology, X, y, learning_rate);
  nn_thetas = unrollThetas(thetas);
end

model = rollThetas(nn_thetas, topology)
pred = predict(model, X)
fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);