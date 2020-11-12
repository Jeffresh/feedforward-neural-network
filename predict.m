function y_p = predict(thetas, X)
  
  m = size(X, 1);
  num_labels = size(thetas{length(thetas)}, 1);
  
  h = sigmoid([ones(m, 1), X] * thetas{1}');
  for i=2:length(thetas)
    h = sigmoid([ones(m,1), h] * thetas{i}');
  end 
  
  [~, y_p] = max(h, [], 2);

endfunction
