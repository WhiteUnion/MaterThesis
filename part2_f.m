clear; 
clc; 

load('cdf.mat')
load('startTime.mat')
adress='C:\\DevFiles\\ProjectWork_SIMA\\SPAR1\\simu100_406s\\929-20200427114109\\simu100_406s_%d';
adress2='C:\\DevFiles\\ProjectWork_SIMA\\SPAR1\\simu100_606s\\929-20200428125103\\simu100_606s_%d';
adress3='C:\\DevFiles\\ProjectWork_SIMA\\SPAR1\\simu100_406s_H1H2\\929-20200525163834\\simu100_406s_H1H2_%d';
for i=1:100
[PlatMotions_406s,ax_406s, tors_406s, my_406s, mz_406s,wave_406s,time_406s]=readSimu_a(adress,i);
[PlatMotions_606s,ax_606s, tors_606s, my_606s, mz_606s,wave_606s,time_606s]=readSimu_a(adress2,i);
[PlatMotions_H1H2_406s,ax_H1H2_406s, tors_H1H2_406s, my_H1H2_406s, mz_H1H2_406s,wave_H1H2_406s,time_H1H2_406s]=readSimu_a(adress3,i);


% 406s
myH406s(i)= max(my_406s(4001:end));
diff(i)=((myH406s(i)-my_maxH(i))/my_maxH(i))*100;

% 606s
if startTimeH_606s(i)>0
myH606s(i)= max(my_606s(6001:end));
diff2(i)=((myH606s(i)-my_maxH(i))/my_maxH(i))*100;
else
    diff2(i)=0;
end

myH1H2406s(i)= max(my_H1H2_406s(4001:end));
diff3(i)=((myH1H2406s(i)-my_maxH1H2(i))/my_maxH1H2(i))*100;

end

save('my_max.mat','maxMy', 'my_maxH', 'myH406s', 'myH606s', 'my_maxH1H2', 'myH1H2406s')

figure(); 
hold on
plot(diff,'o','linewidth',1.2,'MarkerFaceColor','b');
hold off
axis([-inf inf -2 5])
% xticks([0,256,1256,2256,3256,4060])
% xticklabels({'1674.4','1700','1800','1900','2000','2080.4'})
%legend('Full simulation: 4000s','Short simulation: 1006s','Location','southwest')
xlabel('Simulation')
ylabel('The difference in response (FA) [%]')
grid on
grid minor

figure(); 
hold on
plot(diff2,'s','linewidth',1.2,'MarkerFaceColor','b');
hold off
axis([-inf inf -2 5])
% xticks([0,256,1256,2256,3256,4060])
% xticklabels({'1674.4','1700','1800','1900','2000','2080.4'})
%legend('Full simulation: 4000s','Short simulation: 1006s','Location','southwest')
xlabel('Simulations')
ylabel('The difference in response (FA) [%]')
grid on
grid minor

figure(); 
hold on
plot(diff3,'o','linewidth',1.2,'MarkerFaceColor','r');
hold off
axis([-inf inf -2 5])
% xticks([0,256,1256,2256,3256,4060])
% xticklabels({'1674.4','1700','1800','1900','2000','2080.4'})
%legend('Full simulation: 4000s','Short simulation: 1006s','Location','southwest')
xlabel('Simulation')
ylabel('The difference in response (FA) [%]')
grid on
grid minor
