clear

twos = ones(64, 64) + ones(64, 64)
v = 1:64
rampm1 = v' * ones(1, 64);
rampm2 = v' * v;

oto8pi = 0:(8*pi/64):(8*pi)


sin1 = sin(oto8pi)
sinm1 = sin1' * sin1

sin2 = sin(2*oto8pi)
sinm2 = sin1' * sin2