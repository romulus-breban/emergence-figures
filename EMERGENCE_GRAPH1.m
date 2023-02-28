clear all;

R0prime=0.001:.001:1;

%FIRST FIGURE
mprime1=.1;
mprime2=.001;
mprime3=.00001;

R0=2;
p1=1/R0;

u=(1+1./R0prime)/2;
usqrt1=1-(1-mprime1.*(1-p1))./(R0prime.*u.*u);
usqrt2=1-(1-mprime2.*(1-p1))./(R0prime.*u.*u);
usqrt3=1-(1-mprime3.*(1-p1))./(R0prime.*u.*u);

pprime1=u.*(1-sqrt(usqrt1));
pprime2=u.*(1-sqrt(usqrt2));
pprime3=u.*(1-sqrt(usqrt3));

figure(1);
subplot(2,2,1);
semilogy(R0prime,1-pprime1,'k-',R0prime,1-pprime2,'b-',R0prime,1-pprime3,'r-','LineWidth',2);
xlabel('R_0 of original pathogen, R^\prime_0'); ylabel('probability of emergence, 1-p^\prime_1');

legend('0.1','0.001','0.00001');
xlim([0 1]);
ylim([0.000001 1000])

% %SECOND FIGURE
mprimeh1=.1;
mprimeh2=.001;
mprimeh3=.00001;

p10=0.5;
R0primeh=sqrt(R0prime);

A1=(1+R0prime)./2./R0prime+mprimeh1.*(1-p10)./2./R0primeh;
A2=(1+R0prime)./2./R0prime+mprimeh2.*(1-p10)./2./R0primeh;
A3=(1+R0prime)./2./R0prime+mprimeh3.*(1-p10)./2./R0primeh;

B1=(1-mprimeh1.*(1-p10))./R0prime;
B2=(1-mprimeh2.*(1-p10))./R0prime;
B3=(1-mprimeh3.*(1-p10))./R0prime;

p11prime1=A1-sqrt(A1.*A1-B1);
p11prime2=A2-sqrt(A2.*A2-B2);
p11prime3=A3-sqrt(A3.*A3-B3);

p10prime1=(1-mprimeh1+p10.*mprimeh1+p11prime1.*R0primeh)./(1+R0primeh);
p10prime2=(1-mprimeh2+p10.*mprimeh2+p11prime2.*R0primeh)./(1+R0primeh);
p10prime3=(1-mprimeh3+p10.*mprimeh3+p11prime3.*R0primeh)./(1+R0primeh);

figure(2);
subplot(2,2,1);
semilogy(R0prime,1-p10prime1,'k-',R0prime,1-p10prime2,'b-',R0prime,1-p10prime3,'r-','LineWidth',2);
xlabel('R_0 of original pathogen, R^\prime_0'); ylabel('probability of emergence, 1-p^\prime_{10}');

legend('0.1','0.001','0.00001');
xlim([0 1]);
ylim([0.000001 1000])

%subplot(2,2,4);
%plot(R0prime,1-p10prime1,'b.',R0prime,1-p10prime2,'b.',R0prime,1-p10prime3,'b.');

