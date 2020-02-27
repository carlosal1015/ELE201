a = rand(1, 10000);
b = rand(1, 10000);

tic
result = a + b;
toc

clear result
 
tic
for i = 1:length(a)
    result(i) = a(i) + b(i);
end
toc

tic
result = zeros(1, 10000);
for i = 1:length(a)
    result(i) = a(i) + b(i);
end
toc