clear all;

p1min=0.6;p1max=1.0;
p1=p1min:.0001:p1max;
r0=.7;
m1=.17;m2=.5;

m=m1; %red
rr=(1+1./r0)/2;
s=1-(1-m.*(1-p1))/r0/rr/rr;

s1=s(1:sum(s>0));
p1_1=p1(1:sum(s>0));
F1=rr.*(1-sqrt(s1));

m=m2; %blue
rr=(1+1./r0)/2;
s=1-(1-m.*(1-p1))/r0/rr/rr;

s2=s(1:sum(s>0));
p1_2=p1(1:sum(s>0));
F2=rr.*(1-sqrt(s2));

figure(2);subplot(2,2,2);
plot(p1,p1,':k','LineWidth',1.5);
hold;
plot(p1_1,F1,'r',p1_2,F2,'b','LineWidth',3);axis tight;
hold;

xticks([0.6 .8 1.0]);
yticks([0.6 .8 1.0]);
xlabel('p_{1}^{(k)}');
ylabel('p_{1}^{(k+1)}');


