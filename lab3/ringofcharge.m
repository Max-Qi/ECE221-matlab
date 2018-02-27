function [Etot,Ex,Ey,Ez]=ringofcharge(a, rho_l,x,y,z,N)
    epsilon=8.854e-12;
    dphi=(2*pi)/N; % Discretize the total line length of 2h into N pieces
    phiprime=linspace(0, 2*pi, N);

    denominator = ((x - a .*cos(phiprime)).^2 + (y - a .*sin(phiprime)).^2 + z.^2).^(3/2);

    constant = (rho_l* a)/(4*pi*epsilon);
    dEx = (dphi.*(x-a.*cos(phiprime)))./denominator;
    dEy = (dphi.*(y-a.*sin(phiprime)))./denominator;
    dEz = (dphi.*z)./denominator;
    Ex = constant * sum(dEx);
    Ey = constant * sum(dEy);
    Ez = constant * sum(dEz);

    Etot=(Ex^2+Ey^2+Ez^2)^0.5;

