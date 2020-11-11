function y_encoded = encodeY(y)
  y_encoded = ([1:max(unique(y))] == y)';
end