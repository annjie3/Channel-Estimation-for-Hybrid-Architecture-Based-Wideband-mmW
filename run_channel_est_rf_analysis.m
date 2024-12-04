close all
clear all
clc
%%%%%%%%%%%%%%%%%%%%%
%Variable Definition%
%%%%%%%%%%%%%%%%%%%%%
Nr=16;
Nt=32;
Nc=4;
N=16;
Np=2;
Gt=64;
Gr=32;
Gc=8;
% Nrf=1;
M=60;
Nq=8;
sigm=1;
Nrealizations=1000;
snr_vec=-15:5:15;
A=(2*pi*(0:2^(Nq)-1)/(2^Nq))';
Gt_grid=((1:Gt)-1)*pi/Gt;
Gr_grid=((1:Gr)-1)*pi/Gr;

%rf_vec
rf_vec=[1,2,4];
%AoA/AoD in grid or not in grid
config="in grid";


%nmse_in_grid=zeros(max(rf_vec),length(snr_vec));
load('nmse_in_grid_rf_sweep_1000.mat')

%Loop through number of rf chains :{1,2,4}
for rf=1:length(rf_vec)
    
    Nrf=rf_vec(rf);
       
        %Loop through snr values: -15:5:15
        for snr_ind=1:length(snr_vec)
            target_snr=snr_vec(snr_ind)

            %Compute power p incorporating normalizations for unity norm
            %channel
            sig_power=10^(target_snr/10);
            p=Nt*Nr*sig_power/Np;

            %nmse per realization
            nmse_per_real=zeros(1,Nrealizations);

            %Loop through realizations
            for n=1:Nrealizations
                [hc,delay_taps]=channel(Nt,Nr,Np,Nc,Gr_grid,Gt_grid,config);

                %Form Phi_td as in equation (21), and ytd in (19)
                phi_td=[];
                e=[];
                ytd=[];
                for m=1:M
                    [Fm,Wm,Sm]=frame_param(Nrf,N,Nc,Nt,Nr,A);
                    phi_m=kron(Sm*kron(eye(Nc),transpose(Fm)),Wm');
                    ym_s=sqrt(p)*phi_m*hc;
                    em=noise(sigm,Wm,N,Nr);
                    ym=ym_s+em;
                    ytd=[ytd;ym];
                    e=[e;em];
                    phi_td=[phi_td;phi_m];  
                end
                
                %Form Atx and Arx
                Atx=steering_dict(Gt_grid,Nt,Gt);
                Arx=steering_dict(Gr_grid,Nr,Gr);



                %form Psi as in eqaution (22)
                psi=[];
                for k=1:Nc
                    pk=zeros(Gc,1);
                    if ismember(k,delay_taps)
                        pk(k)=1;
                    end
                    AtxArx=kron(conj(Atx),Arx);
                    psi=[psi;kron(AtxArx,pk')];
                end
                %form dict and invoke OMP to recover sparse signal
                dict=sqrt(p)*phi_td*psi;
                xtd = OMP(dict,ytd,Np);
                nonzero_gain_index=find(xtd~=0);
                %Use kronecker product structure to retrieve delay taps and
                %%AoA/AoD
                for k=1:length(nonzero_gain_index)
                    ind=nonzero_gain_index(k);
                    delay_taps_est(k)=mod(ind-1,Gc)+1;
                    angle_index(k)=ceil(ind/Gc);
                end
                %Form estimated channel vector
                hc_est=[];
                for k=1:Nc
                    if ismember(k,delay_taps_est)
                        ind=find(delay_taps_est==k);
                        if length(ind)>1
                            ind=ind(1);
                        end
                        gain=xtd(nonzero_gain_index(ind));
                        hd=gain*AtxArx(:,angle_index(ind));
                    else
                        hd=zeros(Nt*Nr,1);
                    end
                    hc_est=[hc_est;hd];
                end
                %compute nmse per realization
                nmse_per_real(n)=(norm(hc-hc_est)^2)/(norm(hc)^2);
            end
            %record nmse in nmse matrix
            nmse_in_grid(Nrf,snr_ind)=mean(nmse_per_real);
               
    end
end


