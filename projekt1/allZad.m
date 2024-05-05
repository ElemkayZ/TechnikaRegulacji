%zad1
%definicja zmiennych
syms t s X t2
%definicja funkcji
f1 = 8*t*exp(-1*t); 
f2 = 8-exp(-2*t)*sin(t-1)-cos(t-1)+sin(t-9)*cos(t-9); 
%wykonanie transformat
L1 = laplace(f1, t, s); 
L2 = laplace(f2, t, s); 
% Upraszczanie (możliwe brak upraszczania z powodu przyjęcia jak najmniej
% założeń związanych z zmiennymi symbolicznymi
L1_simplified = simplify(L1);
L2_simplified = simplify(L2);
% Wyświetlenie wynikow
disp('Transformata Laplace''a funkcji f1(t) = ');
disp(L1_simplified);
disp('Transformata Laplace''a funkcji f2(t) = ');
disp(L2_simplified);

%zad2
% Funkcja F(s)
numerator = s^3 + 4*s^2 + 6*s + 5;
denumerator = (s + 8)*(s^2 + 8*s + 3)*(s^2 + 5*s + 7);
L = numerator /denumerator ;

% Obliczenie transformaty odwrotnej Laplace'a za pomocą funkcji ilaplace()
f = ilaplace(L);

% Wyświetlenie wyniku
disp('Odwrotna transformata Laplace''a:');
disp(simplify(f));

% Wektor czasu od 0 do 50 o krokach 0.1
tv = 0:0.1:50; 
%rzutowanie wektora na funkcję
wynik = double(subs(f, t, tv));
% Wygenerowanie wykresu funkcji f(t) za pomocą funkcji ezplot()
figure(1);
plot(tv,wynik);
xlabel('Czas (t)');
ylabel('f(t)');
title('Wykres funkcji f(t)');
grid on;

%zad3

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
figure(2);
plot(t, x);
grid on
legend x(0) dx(0)
% Rozwiązanie numeryczne dla różnych niezerowych wartości początkowych (podpunkt c)
% Przykład 1
x1 = [-10; -10];
[t, x1_sol] = ode45(odefun, t, x1);
figure(3);
plot(t, x1_sol);
grid on
legend x(-10) dx(-10)
% Przykład 2
x2 = [1; 1];
[t, x2_sol] = ode45(odefun, t, x2);
figure(4);
plot(t, x2_sol);
grid on
legend x(1) dx(1)
% Przykład 3
x3 = [10; 10];
[t, x3_sol] = ode45(odefun, t, x3);
figure(5);
plot(t, x3_sol);
grid on
legend x(10) dx(10)

%wszystkie
figure(6);
plot(t, x1_sol,t, x2_sol,t, x3_sol);
grid on
legend x(-10) dx(-10)  x(1) dx(1) x(10) dx(10)

%zad4
Xs = solve(5*s^2*X + (1/9)*s*X + 2*X == 8/s + 1/(s^2 + 1), X);
xt = ilaplace(Xs);

disp('rozwiązanie x(t) :')
disp(xt)

