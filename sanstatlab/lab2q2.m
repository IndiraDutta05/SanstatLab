%% Problem 2: Maximum likelihood/Minsta kvadrat
M = 1e4;
b = 4;
x = raylrnd(b, M, 1);  % Generera M värden från Rayleigh-fördelning

% Rita histogram med densitet
hist_density(x, 40)
hold on

% ML- och MK-skattningar (byt ut med dina faktiska formler)
my_est_ml = sqrt(sum(x.^2) / (2 * length(x)));           % ML-skattning 
my_est_mk = mean(x) * sqrt(2/pi);                        % MK-skattning


% Rita ut skattningarna och det sanna värdet
plot(my_est_ml, 0, 'r*', 'DisplayName', 'ML-skattning')
plot(my_est_mk, 0, 'g*', 'DisplayName', 'MK-skattning')

plot(b, 0, 'ro', 'DisplayName', 'Sant värde')
legend
hold off

fprintf('ML-skattning (b_ml): %.4f\n', my_est_ml);
fprintf('MK-skattning (b_mk): %.4f\n', my_est_mk);

%% Problem 2: Maximum likelihood/Minsta kvadrat (forts.)
% Rita upp täthetsfunktionen med ML-skattningen
hold on
x_vals = 0:0.1:6;
plot(x_vals, raylpdf(x_vals, my_est_ml), 'r', 'DisplayName', 'Täthetsfunktion (ML)')
plot(x_vals, raylpdf(x_vals, my_est_mk), 'g', 'DisplayName', 'Täthetsfunktion (MK)')
legend
hold off
