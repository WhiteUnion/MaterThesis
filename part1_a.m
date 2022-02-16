clc;
clear;

%% Happening probability
load('simu1hour.mat');

cp=0:1:100; % index. 10 index corrosponds to 1 second. 

isSurgeH=isMaxiHappenWaveHeight(wave(inds:40000,:),surge,cp);
isHeaveH=isMaxiHappenWaveHeight(wave(inds:end,:),heave,cp);
isMyH=isMaxiHappenWaveHeight(wave(inds:end,:),my,cp);
isMzH=isMaxiHappenWaveHeight(wave(inds:end,:),mz,cp);
isTorsionH=isMaxiHappenWaveHeight(wave(inds:end,:),Torsion,cp);
isPitchH=isMaxiHappenWaveHeight(wave(inds:end,:),pitch,cp);
isYawH=isMaxiHappenWaveHeight(wave(inds:end,:),yaw,cp);

isMy=isMaxiHappen(wave(inds:end,:),my,cp);

%% plots
% figure 1
figure('name','','color','white')
hold on
plot(0:0.1:10,isMyH,'-','linewidth',2);
plot(0:0.1:10,isMy,'-.','linewidth',2);
hold off
axis([0 10 0 1])
legend('Wave height','Crest height','Location','southeast')
xlabel('Time [s]')
ylabel('Cumulative probability of occurence - maximum FA')
grid on
grid minor
% 
% figure 2
figure('name','','color','white')
hold on
plot(0:0.1:10,isMyH,'-','linewidth',2);
plot(0:0.1:10,isMzH,'-','linewidth',2);
plot(0:0.1:10,isTorsionH,'-','linewidth',2');
plot(0:0.1:10,isSurgeH,'-','linewidth',2);
plot(0:0.1:10,isHeaveH,'-','linewidth',2);
plot(0:0.1:10,isPitchH,'-','linewidth',2);
plot(0:0.1:10,isYawH,'-','linewidth',2);


hold off
axis([0 10 0 1])
legend('FA','SS','Torsion','Surge','Heave','Pitch','Yaw','Heave','Location','northwest')
xlabel('Time [s]')
ylabel('Cumulative probability of occurence')
grid on
grid minor
% 

% figure 3
figure('name','','color','white')
hold on
plot(0:0.1:10,isHeaveH,'-','linewidth',2,'color','k');

hold off
axis([0 10 0 1])
legend('Heave','Location','southeast')
xlabel('Time [s]')
ylabel('Cumulative probability of occurence')
grid on
grid minor

%% functions

function [maxH,maxH_ind]=waveHeightMax(x)
num=length(x(1,:));
maxH_ind=zeros(1,num);
maxH=zeros(1,num);
for i=1:num
[H, H_ind]= getWaveHeightVsIndex(x(:,i));
[maxH(i), temp_ind]= max(H);
maxH_ind(i)= H_ind(temp_ind);  
end
end

function [happeningPercent]= isMaxiHappenWaveHeight(x, r, cp)
[maxH,maxH_ind]= waveHeightMax(x);
[maxR,maxR_ind]= max(r);
pdiff= maxR_ind-maxH_ind;
happeningPercent=zeros(1,length(cp));
for i=1:length(cp)
    happeningPercent(i)=length(pdiff(pdiff>0&pdiff<=cp(i)))/100;
end
end

function [happeningPercent]= isMaxiHappen(x, r,cp)

[maxCH,maxCH_ind]= max(x);
[maxR,maxR_ind]= max(r);
pdiff= maxR_ind-maxCH_ind;

happeningPercent=zeros(1,length(cp));
for i=1:length(cp)
    happeningPercent(i)=length(pdiff(pdiff>0&pdiff<=cp(i)))/100;
end
end
