function out = shiftdown(in,fs,highedge)

%  Syntax:  shiftdown(input,fs,highedge)
%
%  input    is the signal whose frequency content you want to shift
%  fs       is the sampling frequency of the input signal
%  highedge is the value (in Hz) that you want to shift down to DC

indft = fft(in);
l = length(in);

highedgeind = round(highedge/fs*l)+1;
w = l/2-highedgeind+1;

newfft = [indft(highedgeind:l/2),...
         zeros(1,l-2*w),indft(end-w+1:end)];

out = real(ifft(newfft));
