%determine the DTFT of x(n)=(0.9 exp(j*pi/3)).^n, 0<=n<=10, using two period i.e w=(-2*pi,2*Pi)

n=0:10;
k=-1000:1000;
m=500;
w=(pi/m)*k;
xn=(0.9*exp(j*pi/3)).^n;
X=xn*(exp(-j*pi/m)).^(n'*k);
subplot(211)
plot(w,real(X));
subplot(212)
plot(w,imag(X));