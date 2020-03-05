Fs = 8000 % sampling frequency in Hz
f1 = 400
f2 = 440
N = 2100
T = N/Fs % duration of signal
t = 0:1/Fs:T % time axis vector of sample times

sig = cos(2*pi*f1*t) + 2*sin(2*pi*f2*t)

sigconcat = [sig,sig]
plot(sigconcat)

%plot(sig)

fftsig = fft(sig)

f = -Fs/2:Fs/N:Fs/2;        % Frequency vector

fftshiftsig = fftshift(fftsig)

fcon = [f, f]
concat = [fftshiftsig, fftshiftsig]

% 
% subplot(2,1,1)
% plot(f,abs(fftshiftsig))
% title('Magnitude')
% xlabel('Frequency (Hz)')
% ylabel('Magnitude')
% 
% subplot(2,1,2)
% plot(f,angle(fftshiftsig)*180/pi)
% title('Phase')
% xlabel('Frequency (Hz)')
% ylabel('Phase (degrees)')
% 
% subplot(2,1,1)
% plot(fcon,abs(concat))
% title('Magnitude')
% xlabel('Frequency (Hz)')
% ylabel('Magnitude')
% 
% subplot(2,1,2)
% plot(fcon,angle(concat)*180/pi)
% title('Phase')
% xlabel('Frequency (Hz)')
% ylabel('Phase (degrees)')
