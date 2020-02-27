function r_func = rfunc(Fs, f)

Fs = 10000 % sampling frequency in Hz
f1 = 440 % tone frequency Hz
f2 = 480 % tone frequency Hz
T = 2 % duration of signal
t = 0:1/Fs:T % time axis vector of sample times
Amp = 0.5 % amplitude of tone
ph = 0 % phase of tone
r1 = Amp * (sin((2*pi*f1*t)+ph) + sin((2*pi*f2*t)+ph)) % the vector of signal values
z2 = zeros(1, 40000)
r = [r1, z2, r1, z2, r1, z2, r1, z2]
N = 300 % no. of samples to be plotted


soundsc(r, Fs)
