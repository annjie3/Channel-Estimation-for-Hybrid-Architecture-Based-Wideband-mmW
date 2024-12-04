close all
%%%%%%%%%%%%%%%%%%%%%%%%%
% plot figure 4 of paper%
%%%%%%%%%%%%%%%%%%%%%%%%%
figure
 load('nmse_in_grid_M_100_Nreal_300.mat')
 load('nmse_not_in_grid_M_100_Nreal_300.mat')
figure
plot(snr_vec,10*log10(nmse_in_grid(1,:)),'Color','blue','LineStyle',...
    ':','Marker','o')
hold on
plot(snr_vec,10*log10(nmse_not_in_grid(1,:)),'Color','blue','LineStyle',...
    '-','Marker','*')

title("M=100, 300 realizations of channel,figure(4) of paper")
xlabel("received snr")
ylabel("nmse")
legend(" AoA/AoD in grid","AoA/AoD not in grid")
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%
% plot figure 5 of paper%
%%%%%%%%%%%%%%%%%%%%%%%%%
figure
load('nmse_in_grid_rf_sweep_1000.mat')
plot(snr_vec,10*log10(nmse_in_grid(1,:)),'Color','blue','LineStyle',...
    '--','Marker','o')
hold on
plot(snr_vec,10*log10(nmse_in_grid(2,:)),'Color','#FF8800','LineStyle',...
    '-','Marker','+')

hold on
plot(snr_vec,10*log10(nmse_in_grid(4,:)),'Color','green','LineStyle',...
    '-','Marker','*')

title("M=60, 1000 realizations of channel, figure(5) of paper")
xlabel("received snr")
ylabel("nmse")
legend(" 1 RF chain","2 RF chains","4 RF chains")
hold off



% hold on
% plot(snr_vec,10*log10(nmse_not_in_grid(2,:)),'Color','#FF8800','LineStyle',...
%     '-','Marker','*')
% legend("M=80 AoA/AoD in grid","M=100 AoA/AoD in grid",...
%     "M=80 AoA/AoD in grid","M=100 AoA/AoD not in grid")