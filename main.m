load('wine.data')

X = wine(:,2:end);
y = wine(:,1);

hidden_layers = [5]
[theta, topology] = createTopology(X, hidden_layers, y)









