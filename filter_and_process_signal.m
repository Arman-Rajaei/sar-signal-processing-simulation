% filter_and_process_signal.m
% Load noisy SAR-like signal and apply wavelet denoising

% Load the signal
load('results/simulated_signals.mat');  % contains: clean_signal, noisy_signal, t, fs

% Apply wavelet denoising
wname = 'db4';             % Daubechies wavelet
level = 5;                 % Decomposition level
denoised_signal = wdenoise(noisy_signal, level, 'Wavelet', wname);

% Plot original vs. denoised
figure;
subplot(3,1,1);
plot(t, clean_signal); title('Clean Signal'); ylabel('Amplitude');

subplot(3,1,2);
plot(t, noisy_signal); title('Noisy Signal'); ylabel('Amplitude');

subplot(3,1,3);
plot(t, denoised_signal); title('Denoised Signal (Wavelet)'); xlabel('Time (s)'); ylabel('Amplitude');

% Save denoised result
save('results/denoised_wavelet.mat', 'denoised_signal');