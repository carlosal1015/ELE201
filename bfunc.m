function b_func = bfunc(Fs, f)

Fs = 10000 % sampling frequency in Hz
f1 = 480 % tone frequency Hz
f2 = 620 % tone frequency Hz
T = 5 % duration of signal
t = 0:1/Fs:T % time axis vector of sample times
Amp = 0.5 % amplitude of tone
ph = 0 % phase of tone
b1 = Amp * (sin((2*pi*f1*t)+ph) + sin((2*pi*f2*t)+ph)) % the vector of signal values
z1 = zeros(1, 5000)
b = [b1, z1, b1, z1, b1, z1, b1, z1]
N = 300 % no. of samples to be plotted

soundsc(b, Fs)
