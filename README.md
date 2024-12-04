This code aims to replicate the time domain channel estimation results presented in Figures 4 and 5 of the referenced paper. The simulations are conducted with 300 and 1000 channel realizations for Figures 4 and 5, respectively. For simplicity, pulse shaping is omitted, and the pulse shaping function prs() is replaced by a delta function. Also, the time domain pilot symbols sm are complex Gaussian samples. This simulation can be vectorized to reduce complexity.

The simulation includes the following modules:
run_channel_est_AoA_AoD_analysis.m: The main script that calls all necessary functions to generate the data for Figure 4.
run_channel_est_rf_analysis.m: The main script that calls all necessary functions to generate the data for Figure 5.
frame_param.m: A function that generates the pilot symbols, precoder, and combiner for each frame m.
noise.m: A function that generates noise with combiner Wm for frame m.
OMP.m: A function that runs the OMP algorithm to generate the sparse output xtd, from which the delay, AoA, and AoD are derived.
channel.m: A function that generates a channel realization.
steering_dict.m: A function that forms the steering dictionaries Atx and Arx.
steering_vec.m: A function that forms and returns a ULA steering vector given an AoA/AoD and the array length.
plot_nmse.m: A function that plots the saved data from modules (1) and (2), with the output in result.pdf.
The results are compiled in results.pdf.


The goal of this work is to aid in understanding the materials presented in the paper, enhance simulation skills, and develop the ability to follow through mathematical formulations.

Paper:
K. Venugopal, A. Alkhateeb, N. González Prelcic and R. W. Heath, "Channel Estimation for Hybrid Architecture-Based Wideband Millimeter Wave Systems," in IEEE Journal on Selected Areas in Communications, vol. 35, no. 9, pp. 1996-2009, Sept. 2017, doi: 10.1109/JSAC.2017.2720856.
keywords: {Channel estimation;OFDM;Frequency-domain analysis;Training;Wideband;Dictionaries;MIMO;Millimeter wave communications;channel estimation;frequency-selective channel;hybrid precoder-combiner;compressed sensing;sparse recovery;multi-stream MIMO;IEEE 802.11ad},

