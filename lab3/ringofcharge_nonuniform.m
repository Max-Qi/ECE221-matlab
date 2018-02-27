function [ Etot, Ex, Ey, Ez ] = ringofcharge_nonuniform( a, rho_l, x, y, z, N )
    epsilon = 8.854e-12;
    dt = 2*pi/N;
    phiprime = linspace(0, 2*pi, N + 1);
    constant = (1/(4 * pi * epsilon));
    
    for i=1:N
        delta_x = x - a * cos(phiprime(i));
        delta_y = y - a * sin(phiprime(i));
        integrand = a * rho_l(i) * dt/((delta_x^2 + delta_y^2 + z^2)^(3/2));
        dEx(i) = integrand * delta_x;
        dEy(i) = integrand * delta_y;
        dEz(i) = integrand * z;
    end 
   
    Ex = constant * sum(dEx);
    Ey = constant * sum(dEy);
    Ez = constant * sum(dEz);

    Etot=(Ex^2+Ey^2+Ez^2)^0.5;
    
   
end
