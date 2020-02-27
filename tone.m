clear
clf reset

Fs = 1000 % sampling frequency in Hz
f = 262 % tone frequency Hz
T = 3 % duration of signal
t = 0:1/Fs:T % time axis vector of sample times
Amp = -2 % amplitude of tone
ph = .2 % phase of tone
x = Amp * sin((2*pi*f*t)+ph) % the vector of signal values
N = 300 % no. of samples to be plotted

plot(t,x,'r')
grid
xlabel('time-secs')
ylabel('signal value')
title('A Plot of a Sample Signal')
sound(x,Fs) % play the signal