close all
%  load('nmse_in_grid_M_100_Nreal_300.mat')
%  load('nmse_not_in_grid_M_100_Nreal_300.mat')

% hold on
% plot(snr_vec,10*log10(nmse_in_grid(2,:)),'Color','#FF8800','LineStyle',...
%     ':','Marker','o')


% hold on
% plot(snr_vec,10*log10(nmse_not_in_grid(2,:)),'Color','#FF8800','LineStyle',...
%     '-','Marker','*')
% legend("M=80 AoA/AoD in grid","M=100 AoA/AoD in grid",...
%     "M=80 AoA/AoD in grid","M=100 AoA/AoD not in grid")

plot(snr_vec,10*log10(nmse_in_grid(1,:)),'Color','blue','LineStyle',...
    ':','Marker','o')
hold on
plot(snr_vec,10*log10(nmse_not_in_grid(1,:)),'Color','blue','LineStyle',...
    '-','Marker','*')

title("M=100, 300 realizations of channel")
xlabel("received snr")
ylabel("nmse")
legend(" AoA/AoD in grid","AoA/AoD not in grid")