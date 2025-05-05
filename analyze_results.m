% analyze_results.m
% Compute SNR before and after denoising and visualize the results

% Load signals
load('results/simulated_signals.mat');      % clean_signal, noisy_signal
load('results/denoised_wavelet.mat');       % denoised_signal

% Helper function to compute SNR
compute_snr = @(x, x_hat) 10 * log10(sum(x.^2) / sum((x - x_hat).^2));

% Compute SNR
snr_noisy = compute_snr(clean_signal, noisy_signal);
snr_denoised = compute_snr(clean_signal, denoised_signal);

% Display in console
fprintf('SNR of Noisy Signal    : %.2f dB\n', snr_noisy);
fprintf('SNR of Denoised Signal : %.2f dB\n', snr_denoised);

% Plot SNR comparison
figure;
bar([snr_noisy, snr_denoised]);
set(gca, 'XTickLabel', {'Noisy', 'Denoised'});
ylabel('SNR (dB)');
title('SNR Improvement with Wavelet Denoising');
grid on;

% Save figure
saveas(gcf, 'results/snr_comparison.png');