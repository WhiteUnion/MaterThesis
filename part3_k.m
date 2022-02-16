clear; 
clc; 

load('my_max.mat');

%% parameters

% number 2: Mean of 5 1-hour simulation
maxMy5=[maxMy(1:20); maxMy(21:40);maxMy(41:60) ;maxMy(61:80); maxMy(81:100)]; 
maxMy5_mean=mean(maxMy5);

% number 3: Mean of 5 406-seconds simulation
maxMy5_406s=[myH406s(1:20); myH406s(21:40);myH406s(41:60) ;myH406s(61:80); myH406s(81:100)]; 
maxMy5_406s_mean=1.1.*mean(maxMy5_406s);

% number 4: Mean of 5 406-seconds simulation - 1st/2nd H_max
maxMy5H1H2_406s=[myH1H2406s(1:20); myH1H2406s(21:40);myH1H2406s(41:60) ;myH1H2406s(61:80); myH1H2406s(81:100)]; 
maxMy5H1H2_406s_mean=1.05.*mean(maxMy5H1H2_406s);

%% Fitting to gumbel: 
gumbel_ME_my=gumbel_ME(maxMy);
gumbel_ME_my5=gumbel_ME(maxMy5_mean);
gumbel_ME_my5_406s=gumbel_ME(maxMy5_406s_mean);
gumbel_ME_my5H1H2_406s=gumbel_ME(maxMy5H1H2_406s_mean);

%% Histogram og PDF
% I should investigate how the maximum response of 100 1-hour simulation
% looks in gumbel PDF :)
gumbel_fx=gumbel_ME_PDF(maxMy);
gumbel_fx5_mean=gumbel_ME_PDF(maxMy5_mean);
gumbel_fx5_406s_mean=gumbel_ME_PDF(maxMy5_406s_mean);
gumbel_fx5H1H2_406s_mean=gumbel_ME_PDF(maxMy5H1H2_406s_mean);

%% Figures: 
x_g=3e5:100:6.5e5;

figure('name','','color','white')
hold on
plot(x_g,gumbel_fx,'-','linewidth',1.5,'color','k');
plot(x_g,gumbel_fx5_mean,'--','linewidth',1.2,'color','k');
plot(x_g,gumbel_fx5_406s_mean,'--','linewidth',1.2,'color','b');
plot(x_g,gumbel_fx5H1H2_406s_mean,'--','linewidth',1.2,'color','r');

xline(mean(maxMy5_mean),'-.k');
xline(mean(maxMy5_406s_mean),'-.b');
xline(mean(maxMy5H1H2_406s_mean),'-.r');

hold off
axis([3e5 6.5e5 -inf inf])
legend('1h','Ex-1h','Ex-406s,H_{max}','Ex-406s,1st/2nd H_{max}',...
    'Ex-Ex-1h','Ex-Ex-406s,H_{max}','Ex-Ex-406s,1st/2nd H_{max}','Location','northeast')
xlabel('Maximum FA-moment [kNm]')
ylabel('PDF')
grid on
grid minor

%% histogram 
figure('name','','color','white')
histogram(maxMy5_mean,5)
hold on
plot(x_g,gumbel_fx5_mean.*x_g,'--','linewidth',1.2,'color','k');

axis([-inf inf 0 20])
legend('Histogram','Ex-1h','Location','northeast')

xlabel('Maximum FA-moment [kNm]')
grid on
grid minor

figure('name','','color','white')
histogram(maxMy5_406s_mean,5)
hold on
plot(x_g,gumbel_fx5_406s_mean.*x_g,'--','linewidth',1.2,'color','k');

axis([-inf inf 0 20])
legend('Histogram','Ex-406s,H_{max}','Location','northeast')
xlabel('Maximum FA-moment [kNm]')
grid on
grid minor

figure('name','','color','white')
histogram(maxMy5H1H2_406s_mean,5)
hold on
plot(x_g,gumbel_fx5H1H2_406s_mean.*x_g,'--','linewidth',1.2,'color','r');

axis([-inf inf 0 20])
legend('Histogram','Ex-406s,1st/2nd H_{max}','Location','northeast')
xlabel('Maximum FA-moment [kNm]')
grid on
grid minor