function [J, grad] = nnCostfunction(nn_thetas, topology, X, y)
  m = size(X,1);
  
  thetas = rollThetas(nn_thetas, topology);
  
  
  
  % Feedforward
  
  a{1} = [ones(m,1), X];
  z{2} = thetas{1} * a{1}';    

  
  for i=2:length(topology)-1
    a{i} = sigmoid(z{i});
    a{i} = [ones(1, size(a{i}, 2)); a{i}];
    z{i+1} = thetas{i} * a{i};
  end
   h = sigmoid(z{length(topology)});
  
  y_vec = encodeY(y);
  
  for i=1:length(thetas)
    theta = thetas{i};
    thetas{i} = theta(:, 2:end);
  end
  
  J = (-sum(y_vec(:) .* log(h(:)) + (1-y_vec(:)).*log(1-h(:)))/m);
 
  % Backpropagation
  
  delta{length(topology)} = (h - y_vec);
  theta_grad{length(topology)-1} = 1/m.*(delta{length(topology)} * a{length(a)}')

  
  for i = length(topology)-1:-1:2
    delta{i} = thetas{i}' * delta{i+1} .*sigmoidGradient(z{i})
    if(i~=2)
      theta_grad{i-1} =1/m.*(delta{i} * a{i-1}')
    end
  end
  
  theta_grad{1} =1/m.*(delta{2} * a{1})
  
  
   
  grad = [];
  for i=1:length(theta_grad)
    td = theta_grad{i};
    grad = [grad; td(:)];
  end
   
  
  