function [Etot,Ex,Ey,Ez]=plotringofcharge_y(a,Q,y,N)
    %epsilon=8.854e-12;
    rho_l = Q /(2*pi*a);
    x = 0;
    z = 0;
    y1 = 0.1;
    y2 = 2;
    y = linspace(y1, y2, 100);
    Etot = zeros(1, length(y));
        Ex = zeros(1, length(y));    
        Ey = zeros(1, length(y));    
        Ez = zeros(1, length(y));  
    for i=1:length(y)
        [Etot(i),Ex(i),Ey(i),Ez(i)]=ringofcharge(a, rho_l,x,y(i),z,N);
    end

    %Etheory = (rho_l * a * z)./(2*epsilon*(((a.^2)+(z.^2)).^1.5));
     figure;
    hold on;    
    grid on;
    plot(y, Ex, 'b--');
    plot(y, Ey);
    plot(y, Ez, 'r:');
    legend('Ex', 'Ey', 'Ez');
    xlabel('y(m)');
    ylabel('E(m/C)');
    title('Electric fields along the y-axis');
end
