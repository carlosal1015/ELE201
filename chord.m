clear
clf reset

Fs = 8000 % sampling frequency in Hz
f_C = 262 % tone frequency Hz
f_E = 330
f_G = 392
T = 3 % duration of signal
t = 0:1/Fs:T % time axis vector of sample times
Amp = 1 % amplitude of tone
ph = 0 % phase of tone
x = Amp * (sin((2*pi*f_C*t)+ph) + sin((2*pi*f_E*t)+ph) + sin((2*pi*f_G*t)+ph)) % the vector of signal values
N = 300 % no. of samples to be plotted

plot(t,x,'r')
grid
xlabel('time-secs')
ylabel('signal value')
title('A Plot of a Sample Signal')
soundsc(x,Fs) % play the signal