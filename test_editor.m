clear % clear memory
clf reset % clear all figures
T = 10; % signal duration
Fs = 8000; % sampling frequency
f = 440; % frequency of sound
t = 0:1/Fs:T; % time axis
n = T*paFs; % length of vector
x = 4 * exp(-2*t).*sin(2*pi*f*t);
plot(t(1:n),x(1:n),'r')
grid
xlabel('time-secs')
ylabel('signal value - volts')
title('A Plot of a Simple Signal')
sound(x,Fs) % play the signal