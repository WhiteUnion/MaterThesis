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
maxH_ind(i)= H_ind(temp_ind);
my_maxH(i)=max(my(maxH_ind(i):(maxH_ind(i)+60),i));

dev(i)= (maxMy(i)-my_maxH(i))/maxMy(i)*100; % persent

H2=H;
H2(temp_ind)=0;
[maxH2, temp_ind]= max(H2);
maxH2_ind= H_ind(temp_ind);
my_maxH2(i)=max(my(maxH2_ind:(maxH2_ind+60),i));



if my_maxH(i)<my_maxH2(i)
my_maxH1H2(i)= my_maxH2(i);
maxH1H2_ind(i)= maxH2_ind;

else 
 my_maxH1H2(i)= my_maxH(i);
 maxH1H2_ind(i)= maxH_ind(i);

end

dev2(i)= (maxMy(i)-my_maxH1H2(i))/maxMy(i)*100;
end

n=ceil(max(dev));
cdf_diff=zeros(1,n);
for i=2:n+1
    cdf_diff(i-1)=length(dev(dev<i))/100;
end


%% startig Time
startTimeH_406s= maxH_ind;
startTimeH1H2_406s= maxH1H2_ind;

startTimeH_606s= maxH_ind-2000; 


%% CDF
cdf_maxMy=cdf(maxMy);
cdf_myMaxH=cdf(my_maxH);
cdf_myMaxH1H2=cdf(my_maxH1H2);

%% save 
save('startTime.mat', 'startTimeH_406s', 'startTimeH_606s', 'startTimeH1H2_406s');
save('cdf.mat','maxMy', 'cdf_maxMy','my_maxH', 'cdf_myMaxH','my_maxH1H2','cdf_myMaxH1H2');


%% Plot
figure('name','','color','white')
hold on
plot(sort(maxMy),cdf_maxMy,'-','linewidth',2);
plot(sort(my_maxH),cdf_myMaxH,'--','linewidth',2);
plot(sort(my_maxH1H2),cdf_myMaxH1H2,'-.','linewidth',2);
hold off
%axis([2e5 6.5e5 0 1])
%xticks([0, 1, 2, 3, 4, 5])
%xticklabels({'0','1^{st}','2^{nd}','3^{rd}','4^{th}','5^{th}'})
legend('Maximum response of simulation','Response of max H','Response of 1^{st} or 2^{nd} max H','Location','northwest')
xlabel('Maximum FA-moment [kNm]')
ylabel('CDF')
grid on
grid minor


figure('name','','color','white')
hold on
plot(dev,'o','linewidth',2,'MarkerFaceColor','b');
plot(dev2,'o','linewidth',2,'MarkerFaceColor','b');
hold off
% axis([0 n 3.5e5 inf])
% xticks(0:12)
% xticklabels({'0','1^{th}','2^{th}','3^{th}','4^{th}','5^{th}','6^{th}','7^{th}','8^{th}','9^{th}','10^{th}','11^{th}','12^{th}'})
%legend('Heave','Location','southeast')
xlabel('')
ylabel('%')
grid on
grid minor