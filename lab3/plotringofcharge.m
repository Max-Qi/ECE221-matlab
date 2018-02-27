function [Etot,Ex,Ey,Ez]=plotringofcharge(a,Q,z,N)
    epsilon=8.854e-12;
    rho_l = Q /(2*pi*a);
    x = 0;
    y = 0;
    z1 = -3;
    z2 = 3;


    z = linspace(z1, z2, 500);

    for i=1:length(z)
        [Etot(i),Ex(i),Ey(i),Ez(i)]=ringofcharge(a, rho_l,x,y,z(i),N);
    end

    Etheory = (rho_l * a * z)./(2*epsilon*(((a.^2)+(z.^2)).^1.5));
    figure
    %plot(z,Ez, '-b');
    %hold on
    plot(z,Ez, '-b',z, Etheory, 'ro')

    grid on
    xlabel('z');
    ylabel('Ez');
    legend('Ez','Etheory');
    title('Electric Fields along the z-axis');