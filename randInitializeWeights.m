function W = randInitializeWeights(L_in, L_out, epsilon=0.12)
  W = zeros(L_out, 1 + L_in);
  W = rand(L_out, 1 + L_in) * 2 * epsilon - epsilon;
  W(:, 1) = 1;
endfunction
