function nn_thetas = unrollThetas(theta_matrix)
  nn_thetas = []
  for i=1:length(theta_matrix)
    t = theta_matrix{i};
    nn_thetas = [nn_thetas; t(:)];
  end
end
