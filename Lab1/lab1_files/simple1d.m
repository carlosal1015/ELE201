twos = ones(1, 50)+ones(1, 50)
ramp1 = 5:55
ramp2 = 23:-.1:18
rampprod = ramp1 .* ramp2
oto4pi = 0:0.01:(4*pi)
a = 3
v = 0.7
b = 0.3

cos1 = a * cos((2 * pi * v * oto4pi) + b)