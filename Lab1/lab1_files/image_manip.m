load('artdeco.mat')
colormap gray
cropped = im(128:287, 58:217)
new = cropped(1:4:160, 1:4:160)
imagesc(cropped)
