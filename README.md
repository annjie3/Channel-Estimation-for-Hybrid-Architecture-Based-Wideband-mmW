This code attempts to regenerate the time domain channel estimation results in figure 4 of the paper below.
The modeled equivalent channel model uses a sync/rectangular pulse. The results contained in the the results.pdf 
are attained with 50 realizations of the channel. This simulation uses more loops than necessary and can be vectorize
to reduce complexity and generate smoother results with more realizations.

The goal is to enhance my simulation skills and ability to mathematically work through the derivations.

Paper:
K. Venugopal, A. Alkhateeb, N. González Prelcic and R. W. Heath, "Channel Estimation for Hybrid Architecture-Based Wideband Millimeter Wave Systems," in IEEE Journal on Selected Areas in Communications, vol. 35, no. 9, pp. 1996-2009, Sept. 2017, doi: 10.1109/JSAC.2017.2720856.
keywords: {Channel estimation;OFDM;Frequency-domain analysis;Training;Wideband;Dictionaries;MIMO;Millimeter wave communications;channel estimation;frequency-selective channel;hybrid precoder-combiner;compressed sensing;sparse recovery;multi-stream MIMO;IEEE 802.11ad},

