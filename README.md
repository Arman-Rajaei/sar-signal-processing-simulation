# SAR Signal Processing Simulation

This project simulates a simplified Synthetic Aperture Radar (SAR)-like signal acquisition scenario and applies advanced signal processing techniques such as wavelet-based denoising to enhance signal quality. The goal is to demonstrate algorithm development and performance analysis in the context of SAR or radar-inspired signal processing.

---

## 🛰️ Project Overview

- Simulates radar-like echo signals with multiple targets and added Gaussian noise.
- Applies wavelet denoising to improve signal quality.
- Computes and visualizes Signal-to-Noise Ratio (SNR) before and after denoising.

---

## 📂 Repository Structure

sar-signal-processing-simulation/
├── simulate_sar_signal.m % Simulate SAR-like echo signal
├── filter_and_process_signal.m % Wavelet denoising
├── analyze_results.m % Compute & visualize SNR improvement
├── results/ % Saved .mat files and plots
├── README.md % Project documentation
└── .gitignore % Ignore .mat, checkpoints, etc.

---

## 🛠️ Technologies Used

- MATLAB R2023b
- Signal Processing Toolbox
- Wavelet Toolbox

---

## 📈 Example Outputs

### Signal Comparison

![Wavelet Denoising](results/snr_comparison.png)

### SNR Improvement
- **Noisy Signal**: ~0 dB
- **Denoised Signal**: ~X dB *(varies with parameters)*

---

## 🔍 How to Run

1. Clone the repository  
   `git clone https://github.com/yourusername/sar-signal-processing-simulation.git`

2. Open in MATLAB.

3. Run the scripts in order:
   - `simulate_sar_signal.m`
   - `filter_and_process_signal.m`
   - `analyze_results.m`

---

## 📌 Purpose

This project demonstrates practical signal processing techniques relevant to radar systems, remote sensing, and satellite imaging — particularly in alignment with roles involving Synthetic Aperture Radar (SAR) signal analysis and algorithm development.

---

## 🧑‍💻 Author

**Arman Rajaei**  
