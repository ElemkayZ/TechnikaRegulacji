% Zdefiniowanie zmiennej symbolicznej
syms s t

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
figure;
plot(tv,wynik);
xlabel('Czas (t)');
ylabel('f(t)');
title('Wykres funkcji f(t)');
grid on;
