function d_func = dfunc(Fs, f)

Fs = 10000 % sampling frequency in Hz
f1 = 350 % tone frequency Hz
f2 = 440 % tone frequency Hz
T = 4 % duration of signal
t = 0:1/Fs:T % time axis vector of sample times
Amp = 0.5 % amplitude of tone
ph = 0 % phase of tone
d = Amp * (sin((2*pi*f1*t)+ph) + sin((2*pi*f2*t)+ph)) % the vector of signal values
N = 300 % no. of samples to be plotted


soundsc(d, Fs)