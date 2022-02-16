clear; 
clc; 

%load('simu1hour.mat');

adress= 'C:\\DevFiles\\ProjectWork_SIMA\\SPAR1\\transTime\\929-20200422101741\\transTime_%d';


for i= 1:9
        [PlatMotions_short,Ax_short, Tors_short,...
        my_short, mz_short,wave_short,time_short]=readSimu_a(adress,i);
    
    my_seed1(:,i)=my_short(((i+1)*1000+1):end);
    diff_seed1(i)= ((-my(16771,100)+my_seed1(27,i))/my(16771,100))*100;
end


for i= 10:18
        [PlatMotions_short,Ax_short, Tors_short,...
        my_short, mz_short,wave_short,time_short]=readSimu_a(adress,i); 
    my_seed2(:,i-9)=my_short(((i-8)*1000+1):end);
    diff_seed2(i-9)= ((-my(15694,81)+my_seed2(25,i-9))/my(15694,81))*100;
end

for i= 19:27
        [PlatMotions_short,Ax_short, Tors_short,...
        my_short, mz_short,wave_short,time_short]=readSimu_a(adress,i);
        my_seed3(:,i-18)=my_short(((i-17)*1000+1):end);
        diff_seed3(i-18)= ((-my(25702,93)+my_seed3(43,i-18))/my(25702,93))*100;
end

figure('name','','color','white')
hold on
plot(diff_seed1,'o','linewidth',2,'MarkerFaceColor','b');
plot(diff_seed2,'s','linewidth',2,'MarkerFaceColor','r');
plot(diff_seed3,'h','linewidth',2,'MarkerFaceColor','k');

hold off
axis([0 9 -2 2])
xticks([0,1, 2, 3, 4, 5,6,7,8,9])
xticklabels({'0','206','306','406','506','606','706','806','906','1006'})
legend('seed=200','seed=181','seed=193','Location','southeast')
xlabel('The simulation length[s]')
ylabel('The difference in FA-moment [%]')
grid on
grid minor
