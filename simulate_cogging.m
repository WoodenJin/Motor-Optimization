clear all;
tic
Walco;                                 % Load motor geometry
theta = linspace(.001, .99*pi, 1)    % Sweep rotor angles from 0 to pi (electrical)
theta_elec = [];
torque = [];

id = 0;
iq = 6*70;

for i = 1:length(theta)
    tic
    theta_elec = [theta_elec; init_geometry_2(g, theta(i), id, iq)];    
    torque = [torque;calc_torque(g)];
    fprintf('Iteration %d took %f seconds\n', i, toc);
end

toc

%figure;plot(theta_elec,- torque);
%xlabel('Electrical Angle');
%ylabel('Torque (N-m)');
%NicePlot;
average_torque = mean(torque)