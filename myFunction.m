% function x = myFunction(Fs, f)
function [x, t] = myFunction(Fs, f)
% function x = myFunction(Fs, f)
% Fs is the sampling frequency
% f is the frequency of sound
% x is the sound signal
T = 10; % signal duration
t = 0:1/Fs:T; % time axis
n = T*Fs; % length of vector
x = 4 * exp(-2*t).*sin(2*pi*f*t);
plot(t(1:n),x(1:n),'r')
grid
xlabel('time-secs')
ylabel('signal value - volts')
title('A Plot of a Simple Signal')
sound(x,Fs) % play the signal