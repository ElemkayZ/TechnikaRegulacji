%definicja zmiennych
syms t s 
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