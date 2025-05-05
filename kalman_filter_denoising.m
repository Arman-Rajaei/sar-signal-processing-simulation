% kalman_filter_denoising.m
% Applies a basic 1D Kalman filter to the noisy signal

% Load data
load('results/simulated_signals.mat');  % clean_signal, noisy_signal, t, fs

% Initialize Kalman filter variables
n = length(noisy_signal);
x_est = zeros(1, n);     % Estimated signal
P = zeros(1, n);         % Error covariance

% Kalman filter parameters
Q = 0.01;                % Process noise covariance
R = 0.5;                 % Measurement noise covariance
A = 1;                   % State transition matrix
H = 1;                   % Measurement matrix

% Initial guesses
x_est(1) = noisy_signal(1);
P(1) = 1;

% Apply Kalman filter
for k = 2:n
    % Prediction
    x_pred = A * x_est(k-1);
    P_pred = A * P(k-1) * A' + Q;

    % Update
    K = P_pred * H' / (H * P_pred * H' + R);
    x_est(k) = x_pred + K * (noisy_signal(k) - H * x_pred);
    P(k) = (1 - K * H) * P_pred;
end

% Plot
figure;
subplot(3,1,1); plot(t, clean_signal); title('Clean Signal');
subplot(3,1,2); plot(t, noisy_signal); title('Noisy Signal');
subplot(3,1,3); plot(t, x_est); title('Kalman Filtered Signal');

% Save result
kalman_filtered_signal = x_est;
save('results/denoised_kalman.mat', 'kalman_filtered_signal');