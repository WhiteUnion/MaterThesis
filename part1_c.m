clc;
clear;
load('simu1hour.mat');

[maxMy,maxMyInd]=max(my);
nthMaxi=zeros(1,100);

for i=1:100
[H, H_ind]= getWaveHeightVsIndex(wave(inds:end,i));
Hc=(H(H_ind<maxMyInd(i)& H_ind>(maxMyInd(i)-60)));
nthMaxi(i)=length(H(H>Hc))+1;

[H_crest, H_crest_ind]= getCrestHeightVsIndex(wave(inds:end,i));
Hc=(H_crest(H_crest_ind<maxMyInd(i)& H_crest_ind>(maxMyInd(i)-60)));
nthMaxi_crest(i)=length(H_crest(H_crest>Hc))+1;
end

n=5;
cdf=zeros(1,n);
for i=2:n+1
    cdf(i-1)=length(nthMaxi(nthMaxi<i))/100;
    cdf_crest(i-1)=length(nthMaxi_crest(nthMaxi_crest<i))/100;
end

figure('name','','color','white')
hold on
plot(1:n,cdf,'o','linewidth',2,'MarkerFaceColor','b');
plot(1:n,cdf_crest,'s','linewidth',2,'MarkerFaceColor','r');

hold off
axis([0 5 0 1])
xticks([0, 1, 2, 3, 4, 5])
xticklabels({'0','1^{st}','2^{nd}','3^{rd}','4^{th}','5^{th}'})
legend('Wave Height','Crest Height','Location','southeast')
xlabel('The n^{th} maximum')
ylabel('Cumulative probability of occurence - maximum FA')
grid on
grid minor