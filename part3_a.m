clear; 
clc; 

load('simu1hour.mat');
load('gumbel.mat');
load('cdf.mat');
load('startTime.mat');
load('my_max.mat');
%% 3.plot

figure(); 
hold on
plot(my_maxH,'o','linewidth',1,'MarkerFaceColor','k','color','k');
plot(myH406s,'s','linewidth',1,'MarkerFaceColor','b','color','b'); 
plot(myH606s,'v','linewidth',1,'MarkerFaceColor','r','color','r');

hold off
axis([-inf inf 2e5 6e5])
% xticks([0,256,1256,2256,3256,4060])
% xticklabels({'1674.4','1700','1800','1900','2000','2080.4'})
legend('1-hour simulation','Short simulation: 406s','Short simulation: 606s','Location','southwest')
xlabel('Simulation')
ylabel('The response of maximum wave height (FA) [kNm]')
grid on
grid minor


%% 4.plot

figure(); 
hold on
plot(my_maxH1H2,'o','linewidth',1,'MarkerFaceColor','k','color','k');
plot(myH1H2406s,'s','linewidth',1,'MarkerFaceColor','r','color','r' );
hold off
axis([-inf inf 2e5 6e5])
% xticks([0,256,1256,2256,3256,4060])
% xticklabels({'1674.4','1700','1800','1900','2000','2080.4'})
legend('1-hour simulation','Short simulation: 406s','Location','southwest')
xlabel('Simulation')
ylabel('The response of 1st/2nd maximum wave height (FA) [kNm]')
grid on
grid minor

%% update parameter: delete the uncorrect simulations

myH606s=myH606s(myH606s~=0);

%% gumbel fitting
gumbel_myH406s=gumbel_ME(myH406s);
gumbel_myH606s=gumbel_ME(myH606s);
gumbel_myH1H2Max_406s= gumbel_ME(myH1H2406s);


%% CDF 
cdf_myH406s=cdf(myH406s);
cdf_myH606s=cdf(myH606s);
cdf_myH1H2Max_406s= cdf(myH1H2406s);


%% 1.plot
x_g=3e5:100:6.5e5;
% 
figure('name','','color','white')
hold on
plot(x_g,gumbel_maxMy_ME,'-','linewidth',1.5,'color','k');
plot(x_g,gumbel_myMaxH_ME,'-','linewidth',1.5,'color','b');
plot(x_g,gumbel_myMaxH1H2_ME,'-','linewidth',1.5,'color','r');
plot(x_g,gumbel_myH406s,'-.','linewidth',1,'color','b');
plot(x_g,gumbel_myH606s,'--','linewidth',1,'color','b');
plot(x_g,gumbel_myH1H2Max_406s,'-.','linewidth',1,'color','r');

hold off
%axis([1e5 8e5 0 1])
legend('1-hour simulation','max H','1^{st}/2^{nd} max H','max H - 406s','max H - 606s','1^{st}/2^{nd} max H - 406s','Location','southeast')
xlabel('Maximum FA-moment [kNm]')
ylabel('CDF: Gumbel')
grid on
grid minor

%% 2.plot
figure('name','','color','white')
hold on
plot(sort(maxMy),cdf_maxMy,'-','linewidth',1.5,'color','k');
plot(sort(my_maxH),cdf_myMaxH,'-','linewidth',1.5,'color','b');
plot(sort(my_maxH1H2),cdf_myMaxH1H2,'-','linewidth',1.5,'color','r');
plot(sort(myH406s),cdf_myH406s,'-.','linewidth',1,'color','b');
plot(sort(myH606s),cdf_myH606s,'--','linewidth',1,'color','b');
plot(sort(myH1H2406s),cdf_myH1H2Max_406s,'-.','linewidth',1,'color','r');

hold off
%axis([1e5 8e5 0 1])
legend('1-hour simulation','max H','1^{st}/2^{nd} max H','max H - 406s','max H - 606s','1^{st}/2^{nd} max H - 406s','Location','southeast')
xlabel('Maximum FA-moment [kNm]')
ylabel('CDF: Sample')
grid on
grid minor




