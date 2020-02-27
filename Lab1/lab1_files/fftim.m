function fftim(im)

s = imagesc(fftshift(log(abs(fft2(im)))),[-1 12]);
colormap(jet),colorbar

[xs,ys] = size(im);

set(s,'xdata',[-round(xs/2) -round(xs/2)+xs-1]);
set(s,'ydata',[-round(ys/2) -round(ys/2)+xs-1]);
set(gca,'xlim',[-xs/2,xs/2],'ylim',[-ys/2,ys/2]);
zoom on
