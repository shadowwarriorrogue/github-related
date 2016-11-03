b=[0.0181 0.0543 0.0543 0.0181];
a=[1.000 -1.76 1.18 -0.278];
k=0:500;
w=(pi/500)*k;
m=0:length(a)-1;
l=0:length(a)-1;
num=b*exp(-j*m'*w);
den=a*exp(-j*l'*w);
h=(num)/(den);
magh=abs(h);
angh=angle(h);
subplot(211)
plot(w,magh);
subplot(212)
plot(w,angh);