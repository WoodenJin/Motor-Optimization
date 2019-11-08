clear all;
Walco;
theta = linspace(.001, .99*pi, 111);
theta_elec = [];
torque = [];

for i = 1:length(theta)
    theta_elec = [theta_elec; init_geometry(g, theta(i), 0, 0)];
    torque = [torque;calc_torque(g)];
end


figure;plot(theta_elec,- torque);
xlabel('Electrical Angle');
ylabel('Cogging Torque (N-m)');
NicePlot;