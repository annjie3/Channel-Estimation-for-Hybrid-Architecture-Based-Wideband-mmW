function [em] = noise(sigm,Wm,N,Nr)
%This function forms the noise vector em for frame m
v=(sigm/sqrt(2))*(randn(Nr,N)+1i*randn(Nr,N));
em=Wm'*v;
em=em(:);
end