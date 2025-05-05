% simulate_sar_signal.m
% Simulates a SAR-like 1D radar return signal with noise

fs = 10e3;                 % Sampling frequency (Hz)
T = 1;                     % Duration in seconds
t = 0:1/fs:T-1/fs;         % Time vector

% Simulate targets as delayed pulses (Gaussian-modulated)
target1 = gauspuls(t - 0.2, 500, 0.5); % Target at 0.2s
target2 = gauspuls(t - 0.5, 800, 0.5); % Target at 0.5s
target3 = gauspuls(t - 0.7, 1000, 0.5); % Target at 0.7s

clean_signal = target1 + target2 + target3;

% Add white Gaussian noise
snr_input = 0; % SNR in dB
noisy_signal = awgn(clean_signal, snr_input, 'measured');

% Plot
figure;
subplot(2,1,1);
plot(t, clean_signal);
title('Clean SAR-Like Signal'); xlabel('Time (s)'); ylabel('Amplitude');

subplot(2,1,2);
plot(t, noisy_signal);
title(['Noisy Signal (SNR = ' num2str(snr_input) ' dB)']);
xlabel('Time (s)'); ylabel('Amplitude');


% Create results folder if it doesn't exist
if ~exist('results', 'dir')
    mkdir('results');
end

% Save signals
save('results/simulated_signals.mat', 'clean_signal', 'noisy_signal', 't', 'fs');