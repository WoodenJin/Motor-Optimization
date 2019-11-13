clear all;
tic
U8;                                 % Load motor geometry
theta = linspace(.001, .99*pi, 51)    % Sweep rotor angles from 0 to pi (electrical)
theta_elec = [];
torque = [];

id = 0;
iq = 9*40;

for i = 1:length(theta)
    tic
    theta_elec = [theta_elec; init_geometry_2(g, theta(i), id, iq, 0)];    
    torque = [torque;calc_torque(g)];
    mo_showdensityplot(0, 0, 2.5, 0, 'mag');
    mo_savebitmap(sprintf('%d.bmp', i));
    fprintf('Iteration %d took %f seconds\n', i, toc);
end

toc

figure;plot(theta_elec, torque);
xlabel('Electrical Angle');
ylabel('Torque (N-m)');
NicePlot;
average_torque = mean(torque)
torque_ripple = max(abs(torque - average_torque))
rms_torque_ripple = rms(torque - average_torque)