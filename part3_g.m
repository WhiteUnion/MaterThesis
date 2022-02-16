clear; 
clc; 

load('my_max.mat');

My5=[maxMy(1:20); maxMy(21:40);maxMy(41:60) ;maxMy(61:80); maxMy(81:100)]; 
maxMy5=max(My5);
meanMy5=mean(My5);

My5_406s=[myH406s(1:20); myH406s(21:40);myH406s(41:60) ;myH406s(61:80); myH406s(81:100)]; 
maxMy5_406s=max(My5_406s);
meanMy5_406s=mean(My5_406s);


MyH1H25_406s=[myH1H2406s(1:20); myH1H2406s(21:40);myH1H2406s(41:60) ;myH1H2406s(61:80); myH1H2406s(81:100)]; 
maxMyH1H25_406s=max(MyH1H25_406s);
meanMyH1H25_406s=mean(MyH1H25_406s);


%% plot 1
figure('name','','color','white')
hold on

plot(sort(maxMy5), cdf(maxMy5),'o','linewidth',1,'MarkerFaceColor','k','color','k');
plot(sort(maxMy5_406s), cdf(maxMy5_406s),'s','linewidth',1,'MarkerFaceColor','b','color','b');
plot(sort(maxMyH1H25_406s), cdf(maxMyH1H25_406s),'v','linewidth',1,'MarkerFaceColor','r','color','r');

hold off
axis([3e5 6.5e5 0 1])
legend('5*1h','5*406s - H_{max}','5*406s - 1st/2nd  H_{max} ','Location','southeast')
xlabel('Maximum of five simulation: FA-moment [kNm]')
ylabel('CDF')
grid on
grid minor

%% plot 2

figure('name','','color','white')
hold on
% maximum 

%mean
plot(sort(meanMy5), cdf(meanMy5),'o','linewidth',1.2,'MarkerFaceColor','k','color','k');
plot(sort(meanMy5_406s), cdf(meanMy5_406s),'s','linewidth',1.2,'MarkerFaceColor','b','color','b');
plot(sort(meanMyH1H25_406s), cdf(meanMyH1H25_406s),'v','linewidth',1.2,'MarkerFaceColor','r','color','r');

hold off
axis([3e5 6.5e5 0 1])
legend('5*1h','5*406s - H_{max}','5*406s - 1st/2nd  H_{max} ','Location','southeast')
xlabel('Mean of five simulation: FA-moment [kNm]')
ylabel('CDF')
grid on
grid minor