
 load('nmse_in_grid.mat')
 load('nmse_not_in_grid.mat')
plot(snr_vec,10*log10(nmse_in_grid(1,:)),'Color','blue','LineStyle',...
    ':','Marker','o')
% hold on
% plot(snr_vec,10*log10(nmse_in_grid(2,:)),'Color','#FF8800','LineStyle',...
%     ':','Marker','o')
% hold on
% plot(snr_vec,10*log10(nmse_not_in_grid(1,:)),'Color','blue','LineStyle',...
%     '-','Marker','*')

hold on
plot(snr_vec,10*log10(nmse_not_in_grid(2,:)),'Color','#FF8800','LineStyle',...
    '-','Marker','*')
% legend("M=80 AoA/AoD in grid","M=100 AoA/AoD in grid",...
%     "M=80 AoA/AoD in grid","M=100 AoA/AoD not in grid")


legend("M=80 AoA/AoD in grid","M=100 AoA/AoD in grid")%,...
%    "M=80 AoA/AoD in grid","M=100 AoA/AoD not in grid")