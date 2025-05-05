% analyze_results.m
% Compute SNR, MSE, and PSNR for different denoising methods and visualize the results

% Load signals
load('results/simulated_signals.mat');      % clean_signal, noisy_signal
load('results/denoised_wavelet.mat');       % denoised_signal
load('results/denoised_kalman.mat');        % kalman_filtered_signal

% === Metric Functions ===
compute_snr = @(x, x_hat) 10 * log10(sum(x.^2) / sum((x - x_hat).^2));
compute_mse = @(x, x_hat) mean((x - x_hat).^2);
compute_psnr = @(x, x_hat) 10 * log10(max(x).^2 / compute_mse(x, x_hat));

% === Compute Metrics ===
% SNR
snr_noisy = compute_snr(clean_signal, noisy_signal);
snr_wavelet = compute_snr(clean_signal, denoised_signal);
snr_kalman = compute_snr(clean_signal, kalman_filtered_signal);

% MSE
mse_noisy = compute_mse(clean_signal, noisy_signal);
mse_wavelet = compute_mse(clean_signal, denoised_signal);
mse_kalman = compute_mse(clean_signal, kalman_filtered_signal);

% PSNR
psnr_noisy = compute_psnr(clean_signal, noisy_signal);
psnr_wavelet = compute_psnr(clean_signal, denoised_signal);
psnr_kalman = compute_psnr(clean_signal, kalman_filtered_signal);

% === Display in Console ===
fprintf('\n--- SNR ---\n');
fprintf('Noisy    : %.2f dB\n', snr_noisy);
fprintf('Wavelet  : %.2f dB\n', snr_wavelet);
fprintf('Kalman   : %.2f dB\n', snr_kalman);

fprintf('\n--- MSE ---\n');
fprintf('Noisy    : %.4f\n', mse_noisy);
fprintf('Wavelet  : %.4f\n', mse_wavelet);
fprintf('Kalman   : %.4f\n', mse_kalman);

fprintf('\n--- PSNR ---\n');
fprintf('Noisy    : %.2f dB\n', psnr_noisy);
fprintf('Wavelet  : %.2f dB\n', psnr_wavelet);
fprintf('Kalman   : %.2f dB\n', psnr_kalman);

% === Plot SNR Comparison ===
figure;
bar([snr_noisy, snr_wavelet, snr_kalman]);
set(gca, 'XTickLabel', {'Noisy', 'Wavelet', 'Kalman'});
ylabel('SNR (dB)');
title('SNR Comparison: Noisy vs. Wavelet vs. Kalman');
grid on;
saveas(gcf, 'results/snr_comparison_all.png');
