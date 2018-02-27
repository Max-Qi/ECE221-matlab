function [ ] = plotringcharge_nonuniform(a, N, z)
    epsilon = 8.854e-12;
    z1 = 3;
    z2 = -3;
    theta = linspace(0, 2*pi, N + 1);
    rho_l =
    
    z = linspace(z1, z2, 201);
    
    Etot = zeros(1, length(z));
    for k = 1:length(z)
        [Etot(k), Ex(k), Ey(k), Ez(k)] = ringofcharge_nonuniform(a, rho_l, 0, 0, z(k), N);

    end
    
    figure;
    hold on;
    grid on;    
    plot(z, Ex, 'r--');
    plot(z, Ey);
    plot(z, Ez, 'b:');
    legend('Ex', 'Ey', 'Ez');
    xlabel('z(m)');
    ylabel('E(m/C)');

end
