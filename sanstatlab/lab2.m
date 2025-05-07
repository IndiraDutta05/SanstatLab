%% Problem 1: Simulering av konfidensintervall
% Parametrar:
n = 25;        % Antal mätningar
mu = 2;        % Väntevärdet
sigma = 1;     % Standardavvikelsen
alpha = 0.05;

% Simulerar n observationer för varje intervall
x = normrnd(mu, sigma, n, 100);  % n x 100 matris med värden

% Skattar mu med medelvärdet
xbar = mean(x);  % vektor med 100 medelvärden

% Beräknar de undre och övre gränserna
undre = xbar - norminv(1 - alpha/2) * sigma / sqrt(n);
ovre = xbar + norminv(1 - alpha/2) * sigma / sqrt(n);

%% Problem 1: Simulering av konfidensintervall (forts.)
% Ritar upp alla intervall
figure(1)
hold on
for k = 1:100
    if ovre(k) < mu  % Rödmarkerar intervall som missar mu
        plot([undre(k) ovre(k)], [k k], 'r')
    elseif undre(k) > mu
        plot([undre(k) ovre(k)], [k k], 'r')
    else
        plot([undre(k) ovre(k)], [k k], 'b')
    end
end

% b1 och b2 är bara till för att figuren ska se snygg ut.
b1 = min(xbar - norminv(1 - alpha/2) * sigma / sqrt(n));
b2 = max(xbar + norminv(1 - alpha/2) * sigma / sqrt(n));
axis([b1 b2 0 101])  % Tar bort outnyttjat utrymme i figuren

% Ritar ut det sanna värdet
plot([mu mu], [0 101], 'g')
hold off

%% Problem 2: Maximum likelihood/Minsta kvadrat
M = 1e4;
b = 4;
x = raylrnd(b, M, 1);  % Generera M värden från Rayleigh-fördelning

% Rita histogram med densitet
hist_density(x, 40)
hold on

% ML- och MK-skattningar (byt ut med dina faktiska formler)
my_est_ml = sqrt(mean(x.^2)/2);   % Exempel på ML-skattning för Rayleigh
my_est_mk = sqrt(2/pi) * mean(x); % Exempel på MK-skattning

% Rita ut skattningarna och det sanna värdet
plot(my_est_ml, 0, 'r*', 'DisplayName', 'ML-skattning')
plot(my_est_mk, 0, 'g*', 'DisplayName', 'MK-skattning')
plot(b, 0, 'ro', 'DisplayName', 'Sant värde')
legend
hold off

%% Problem 2: Maximum likelihood/Minsta kvadrat (forts.)
% Rita upp täthetsfunktionen med ML-skattningen
hold on
x_vals = 0:0.1:6;
plot(x_vals, raylpdf(x_vals, my_est_ml), 'r', 'DisplayName', 'Täthetsfunktion (ML)')
legend
hold off
