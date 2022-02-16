clc;
clear;
load('simu1hour.mat');

%% maximum 1 hour response and 1 hour max wave height response. 
[maxMy,maxMyInd]=max(my); %maximum response
nthMaxi=zeros(1,100);
dev=zeros(1,100);
my_maxH=zeros(1,100);
my_maxH2=zeros(1,100);
my_maxH1H2=zeros(1,100);

for i=1:100
[H, H_ind]= getWaveHeightVsIndex(wave(inds:end,i));
[maxH, temp_ind]= max(H);
maxH_ind= H_ind(temp_ind);
my_maxH(i)=max(my(maxH_ind:(maxH_ind+60),i));

dev(i)= (maxMy(i)-my_maxH(i))/my_maxH(i)*100; % persent

H2=H;
H2(temp_ind)=0;
[maxH, temp_ind]= max(H2);
maxH_ind= H_ind(temp_ind);
my_maxH2(i)=max(my(maxH_ind:(maxH_ind+60),i));

my_maxH1H2(i)=max([my_maxH(i) my_maxH2(i)]);
%nthMaxi(i)=length(H(H>Hc))+1;
end

n=ceil(max(dev));
cdf_diff=zeros(1,n);
for i=2:n+1
    cdf_diff(i-1)=length(dev(dev<i))/100;
end

%% CDF
cdf_maxMy=cdf(maxMy);
cdf_myMaxH=cdf(my_maxH);
cdf_myMaxH1H2=cdf(my_maxH1H2);

%% Gumbel paper for 30 random samples from 100
% r=randperm(100,30);
% gumbel_maxMy_ME=gumbel_ME(maxMy(r));
% gumbel_myMaxH_ME=gumbel_ME(my_maxH(r));
% gumbel_myMaxH1H2_ME=gumbel_ME(my_maxH1H2(r));

%% Gumbel paper for 30 random samples
gumbel_maxMy_ME=gumbel_ME(maxMy);
gumbel_myMaxH_ME=gumbel_ME(my_maxH);
gumbel_myMaxH1H2_ME=gumbel_ME(my_maxH1H2);

save('gumbel.mat', 'gumbel_maxMy_ME','gumbel_myMaxH_ME','gumbel_myMaxH1H2_ME');


%% Plot

x_g=3e5:100:6.5e5;
% 
figure('name','','color','white')
hold on
plot(x_g,gumbel_maxMy_ME,'-','linewidth',2,'color','k');
plot(x_g,gumbel_myMaxH_ME,'-.','linewidth',2,'color','b');
plot(x_g,gumbel_myMaxH1H2_ME,'--','linewidth',2,'color','r');
hold off
%axis([1e5 8e5 0 1])
legend('One hour simulation','max H','1^{st} or 2^{nd} max H','Location','northwest')
xlabel('Maximum FA-moment [kNm]')
ylabel('CDF')
grid on
grid minor

