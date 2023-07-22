%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Andrea Castronovo
% Description: Low-Pass filter with Chebishev first type (flat attenuation
%               band) by specif.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear;
close all;
%Spec.----------------------------------------------
Amax = 2; %dB
Amin = 25; %dB
    %InOrder with Matlab Syntax
    Rp = Amax;
    Rs = Amin;
    %-----------------
fp = 10*10^3; %Hz
fs = 15*10^3; %Hz
Wp = 2*pi*fp; %rad/s
Ws = 2*pi*fs; %rad/s

%Filter order and cutoff frequency
[N,] = cheb1ord(Wp,Ws,Rp,Rs,'s');
%Empty zeros, poles and gain of transfer function
[z,p,k] = cheby1(N,Rp,Wp,'s');
[num,den] = zp2tf(z,p/Wp,k);    % Convert to transfer function form
T = tf(num,den)                 % Transfer Function
%Plot
h = pzplot(T);
grid on;
figure;
freqs(num,den)                  % Frequency response of analog filter
