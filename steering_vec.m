function [array] = steering_vec(ang,L)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
arg=pi*(0:L-1)'*cos(ang);
array=(1/sqrt(L))*exp(1i*arg);
end