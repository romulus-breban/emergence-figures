clear all;

p10min=0.85;p10max=1.0;
p10=p10min:.0001:p10max;
r0=.7;
mh1=.17;mh2=.45;
r0h=.7;

mh=mh1; %red
p11=(1+r0)./(2*r0)+(mh*(1-p10))./(2*r0h);
s=((1+r0)./(2.*r0)+(mh.*(1-p10))./(2.*r0h));
s=s.*s-(1-mh.*(1-p10))./r0;

s=s(1:sum(s>0));
p11=p11(1:sum(s>0));
p10_1=p10(1:sum(s>0));
       
p11=p11-sqrt(s);
F1=(1-(1-p10_1).*mh)./(1+r0h)+r0h./(1 + r0h).*p11;


mh=mh2; %blue
p11=(1+r0)./(2*r0)+(mh*(1-p10))./(2*r0h);
s=((1+r0)./(2.*r0)+(mh.*(1-p10))./(2.*r0h));
s=s.*s-(1-mh.*(1-p10))./r0;

s=s(1:sum(s>0));
p11=p11(1:sum(s>0));
p10_2=p10(1:sum(s>0));

p11=p11-sqrt(s);
F2=(1-(1-p10_2).*mh)./(1+r0h)+r0h./(1 + r0h).*p11;

figure(1);subplot(2,2,2);
plot(p10,p10,':k','LineWidth',1.5);
hold;
plot(p10_1,F1,'r',p10_2,F2,'b','LineWidth',3);axis tight;
hold;

xticks([.9 1.0 1.1]);
yticks([.9 1.0 1.1]);
xlabel('p_{10}^{(k)}');
ylabel('p_{10}^{(k+1)}');


