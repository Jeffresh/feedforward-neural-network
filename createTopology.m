function [theta, topology] = createTopology(X, hidden_layers, y)
    input_layer = size(X,2)
    output_layer = length(unique(y))
    topology = [input_layer, hidden_layers, output_layer]
    for i=1:length(topology)-1
        theta{i} = randInitializeWeights(topology(i), topology(i+1));
    end
end