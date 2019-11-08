n = 37;

t = torque';
for x = 1:n
    t = [t; circshift(t(x,:), 1)];
end

t = mean(t);

figure;plot(t);