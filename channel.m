function [hc,delay_taps] = channel(Nt,Nr,Np,Nc,Gr_grid,Gt_grid,config)
%This function generates the vectorized channel 
%Equation (7) of paper
hc=[];
Gt=length(Gt_grid);
Gr=length(Gr_grid);

delay_taps=randi(Nc,Np,1)';

while true
    if delay_taps(1)==delay_taps(2)
        delay_taps=randi(Nc,Np,1)';
    else
        break
    end
end

complex_gain=(1/sqrt(2))*(randn(Np,1)+1i*randn(Np,1));
if config=="in grid"
    tx_angles=Gt_grid(randi(Gt,Np,1));
    rx_angles=Gr_grid(randi(Gr,Np,1));
else
    tx_angles=(1/(7*Gt))*[10;20]*pi;
    rx_angles=(1/(11*Gr))*[13;17]*pi;
end

for k=1:Nc
    if ismember(k,delay_taps)
        d=find(delay_taps==k);
        gain=complex_gain(d);
        at=steering_vec(tx_angles(d),Nt);
        ar=steering_vec(rx_angles(d),Nr);
        Hd=gain*ar*at';
    else
        Hd=zeros(Nr,Nt);
    end
    hc=[hc;reshape(Hd,size(Hd,1)*size(Hd,2),1)];
end
end