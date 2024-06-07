G = tf(8,[1 1]);
%generowanie charakterystyki nesquika
nyquist(G);
hold on;
grid on
figure;
%punkty ręcznej charakterystyki
real_part = [];
imag_part = [];

t = 0:0.001:10; %czas symulacji
w0Tab = [4,8,12]; %wartości w0
for w0 = w0Tab
    u = sin(w0 * t); %sygnał wejściowy
    [y, t_out, ~] = lsim(G, u, t);%odp sys na syg wej
    A = (max(y) - min(y))/2;%amplityda
    phi = angle(fft(y));
    phi = phi(2);  %przesunięcie
    real_part = [real_part, A * cos(phi)];
    imag_part = [imag_part, A * sin(phi)];
    %wyniki symulacji
    subplot(length(w0Tab), 1, find(w0Tab == w0));
    plot(t, u, 'b', 'DisplayName', 'u(t) = sin(\omega_0t)');
    hold on;
    plot(t, y, 'r', 'DisplayName', sprintf('y(t) = %.2fsin(\\omega_0t + %.2f)', A, phi));
    title(sprintf('Odpowiedź systemu dla \\omega_0 = %.1f', w0));
    xlabel('Czas (s)');
    ylabel('Amplituda');
    legend('show');
    grid on;
end
% Nanoszenie punktów na wykres Nyquista
figure(1);
plot(real_part, imag_part, 'ro', 'MarkerFaceColor', 'r');
legend('Nyquist', 'Odpowiedź sinusoidalna');
hold off;