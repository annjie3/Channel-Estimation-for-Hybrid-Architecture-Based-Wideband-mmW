This code attempts to regenerate the time domain channel estimation results in figure 4 and figure 5 of the paper below.
The simultations are performed with 300 and 1000 channel realizations for figure 4, and 5 respectively.
For simplicity, no pulse shaping is used and the pulse shaping function prs() is replaced by a delta function, and the time domain pilot symbols sm are complex gaussians samples.
This simulation can be vectorized to reduce complexity.

This simulation contains the following modules:
1) run_channel_est_AoA_AoD_analysis.m  is the main script that calls all needed functions to generate the data for figure 4.
2) run_channel_est_rf_analysis.m is the main script that calls all needed functions to generate the data for figure 5.
3) frame_param.m is a function that generates the pilot symbols, precoder, and combiner for each frame m.
4) noise.m is a function that generates the noise with combiner Wm for frame m.
5) OMP.m is a function that runs the OMP algorithm on to generate the sparse out xtd from whose support the delay, AoA and AoD are generated.
6) channel.m is a function that generates a channel realization
7) steering_dict.m is the function that forms the steering dictionaries Atx and Arx
8) steering_vec.m is a function that forms and returns a ULA steering vector giving an AoA/AoD and the array length.
9) plot_nmse.m is a function that plots the saved data from (1,2) above and its output is in result.pdf

The results are contained in the the results.pdf 


The goal of this work is to aid me in understanding of the materials presented in this paper, enhance my simulation skills and develop the ability to follow thorugh mathematical formulations

Paper:
K. Venugopal, A. Alkhateeb, N. González Prelcic and R. W. Heath, "Channel Estimation for Hybrid Architecture-Based Wideband Millimeter Wave Systems," in IEEE Journal on Selected Areas in Communications, vol. 35, no. 9, pp. 1996-2009, Sept. 2017, doi: 10.1109/JSAC.2017.2720856.
keywords: {Channel estimation;OFDM;Frequency-domain analysis;Training;Wideband;Dictionaries;MIMO;Millimeter wave communications;channel estimation;frequency-selective channel;hybrid precoder-combiner;compressed sensing;sparse recovery;multi-stream MIMO;IEEE 802.11ad},

