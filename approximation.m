format short g;
load("data.dat");

x;
y;

s0 = columns(x);
s1 = sum(x);
s2 = sumsq(x);
t0 = sum(y);
t1 = sum(x .* y);

s = [s0 s1 ; s1 s2];
t = [t0 ; t1];
c = s \ t

diffs = y - (x * c(2) + c(1))

o = ((1 / columns(x)) * sum(diffs .^ 2)) ^ 0.5

plot(x, y, 'LineStyle', 'none', 'Marker', '.', x, x * c(2) + c(1), 'LineStyle', '-', 'Marker', 'none');
xlabel("x");
ylabel("y");
title("Approximation results");
legend("Real values", "Approximated values");