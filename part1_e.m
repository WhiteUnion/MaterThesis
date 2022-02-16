clc;
clear;
load('simu1hour.mat');


[maxMy,maxMyInd]=max(my);
nthMaxi=zeros(1,100);

for i=1:100
[H, H_ind]= getWaveHeightVsIndex(wave(inds:end,i));
Hc=(H(H_ind<maxMyInd(i)& H_ind>(maxMyInd(i)-60)));
nthMaxi(i)=length(H(H>Hc))+1;
end

n=max(nthMaxi);
cdf=zeros(1,n);
for i=2:n+1
    cdf(i-1)=length(nthMaxi(nthMaxi<i))/100;
end


figure('name','','color','white')
hold on
plot(nthMaxi,maxMy,'o','linewidth',1.2,'MarkerFaceColor','b','color','b');

plot(1,maxMy(100),'o','linewidth',1.2,'MarkerFaceColor','r','color','r');
plot(2,maxMy(81),'o','linewidth',1.2,'MarkerFaceColor','r','color','r');
plot(12,maxMy(93),'o','linewidth',1.2,'MarkerFaceColor','r','color','r');
hold off
axis([0 n 3.5e5 6e5])
xticks(0:12)
xticklabels({'0','1^{th}','2^{th}','3^{th}','4^{th}','5^{th}','6^{th}','7^{th}','8^{th}','9^{th}','10^{th}','11^{th}','12^{th}'})
%legend('Heave','Location','southeast')
xlabel('The n^{th} maximum wave height')
ylabel('Maximum FA-moment [kNm]')
grid on
grid minor

[maxYaw, maxYaw_ind]= max(yaw);
[maxMz,maxMz_ind]=max(mz);
meanYaw=mean(yaw);


figure('name','','color','white')
hold on
plot(maxYaw,'-','linewidth',2);
ylabel('Maximum yaw motion [Degree]') % ylabel left y-axis
hold on
yyaxis right
plot(maxMz,'-.','linewidth',2);
ylabel('Maximum SS-moment [kNm]')
hold off
axis([0 100 0 inf])
%xticks([0, 5, 10, 15, 20, 25,30,35])
%xticklabels({'0','5^{th}','10^{th}','15^{th}','20^{th}','25^{th}','30^{th}','35^{th}'})
legend('Yaw','SS','location','northeast')
xlabel('Simulations')
grid on
grid minor

