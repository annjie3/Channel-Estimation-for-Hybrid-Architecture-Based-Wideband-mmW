function [Fm,Wm,Sm] = frame_param(Nrf,N,Nc,Nt,Nr,A)
%This function forms the Precoding Matrix Fm, the signal matrix Sm
%and the Combining Matrix Wm for frame m

sm=(1/sqrt(2))*(randn(1,Nrf*N)+1i*randn(1,Nrf*N));
zero_pad=zeros(1,Nrf*Nc);
zero_pad(1)=sm(1);
Sm=toeplitz(sm,zero_pad);
Sm=Sm(Nrf:Nrf:end,:);

pre_ang_index=randi(length(A),Nt,Nrf);
Fm=exp(1i*A(pre_ang_index))/sqrt(Nt);

comb_ang_index=randi(length(A),Nr,Nrf);
Wm=exp(1i*A(comb_ang_index))/sqrt(Nr);

end