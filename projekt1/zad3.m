

% Definicja przedziału czasu (podpunkt a)
Tend = 500; % Koniec przedziału czasowego
dt = 0.01; % Krok czasowy
t = 0:dt:Tend; % Wektor czasu

% Funkcja reprezentująca równanie różniczkowe (podpunkt b)
odefun = @(t, y) [y(2); -2/5*y(1) - 1/45*y(2) + 8/5 + 1/5*sin(t)];

% Zerowe wartości początkowe (podpunkt b)
x0 = [0; 0]; % [x(0); x'(0)]

% Rozwiązanie numeryczne dla zerowych wartości początkowych (podpunkt b)
[t, x] = ode45(odefun, t, [0;0]);
figure(1);
plot(t, x);
grid on
legend x(0) dx(0)
% Rozwiązanie numeryczne dla różnych niezerowych wartości początkowych (podpunkt c)
% Przykład 1
x1 = [-10; -10];
[t, x1_sol] = ode45(odefun, t, x1);
figure(2);
plot(t, x1_sol);
grid on
legend x(-10) dx(-10)
% Przykład 2
x2 = [1; 1];
[t, x2_sol] = ode45(odefun, t, x2);
figure(3);
plot(t, x2_sol);
grid on
legend x(1) dx(1)
% Przykład 3
x3 = [10; 10];
[t, x3_sol] = ode45(odefun, t, x3);
figure(4);
plot(t, x3_sol);
grid on
legend x(10) dx(10)

%wszystkie
figure(5);
plot(t, x1_sol,t, x2_sol,t, x3_sol);
grid on
legend x(-10) dx(-10)  x(1) dx(1) x(10) dx(10)
