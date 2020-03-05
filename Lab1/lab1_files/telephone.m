% plot(tel)

fftsig = fft(tel)
Fs = 8000
N = 1000
f = 0:Fs/9199:Fs;        % Frequency vector

fftshiftsig = fftshift(fftsig)

plot(fftshiftsig)

subplot(2,1,1)
plot(f,abs(fftshiftsig))
title('Magnitude')
xlabel('Frequency (Hz)')
ylabel('Magnitude')

subplot(2,1,2)
plot(f,angle(fftshiftsig)*180/pi)
title('Phase')
xlabel('Frequency (Hz)')
ylabel('Phase (degrees)')

