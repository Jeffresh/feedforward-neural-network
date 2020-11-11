function thetas = rollThetas(nn_thetas, topology)

in = 0;
fin = 0;
step = 0;
    for i=1:length(topology)-1
      dim_1 = topology(i+1);
      dim_2 = topology(i) + 1;
      fin = topology(i+1) * (topology(i) + 1) + in;
      thetas{i} = reshape(nn_thetas(in + 1:fin), dim_1, dim_2);
      step = topology(i+1) * (topology(i) + 1);
      in = in + topology(i+1) * (topology(i) + 1);
    end
end
