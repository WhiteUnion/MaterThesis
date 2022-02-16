function []=weibull(x)
x=sort(x);
Fx=cdf(x);
x_g=3e5:100:6.5e5;
% weibull paper
y=-2*log(1-Fx);

%% Linear regression  y=mx+b
% x_a=mean(x);
% y_a=mean(y);
% 
% sxx=0;
% syy=0;
% sxy=0;
%         for i=1:length(x)
%                 sxx=sxx+(x(i)-x_a)^2;
%                 syy=syy+(x(i)-y_a)^2;
%                 sxy=sxy+(x(i)-x_a)*(y(i)-y_a);
%         end
% 
% slope=sxy/sxx;
% intercept=y_a-(slope*x_a);
% regLine=slope*x+intercept;
% 
% % estimated alpha vs beta;
% beta=1/slope;
% alpha=-intercept*beta;

%% method of momentom
% x_v= std(x,1);
% 
% beta_ME= x_v/1.28255;
% alpha_ME= x_a-0.57722*beta_ME;
% 
% 
% % Method of momentum estimated line on Gumbel paper
% ME_line =(1/beta_ME)*x-(alpha_ME/beta_ME);
% 
% %Gumbel distro
% gumbelFx= exp(-exp(-((x_g-alpha)/beta)));
% gumbelFx_ME= exp(-exp(-((x_g-alpha_ME)/beta_ME)));


%% plot

figure('name','','color','white')
hold on
plot(x,y,'o','linewidth',2,'MarkerFaceColor','b');
plot(x,regLine,'-.','linewidth',2,'Color','r');
plot(x,ME_line,'-','linewidth',2,'Color','g');
hold off
%axis([6e5 9.5e5 -3 5])
%xticks([0, 1, 2, 3, 4, 5])
%xticklabels({'0','1^{st}','2^{nd}','3^{rd}','4^{th}','5^{th}'})
legend('Observation','Linear regression','Method of moment','Location','southeast')
xlabel('Maximum FA-moment [kNm]')
ylabel('-ln{-ln(Fx)}')
grid on
grid minor


figure('name','','color','white')
hold on
plot(x,Fx,'o','linewidth',2,'MarkerFaceColor','b')
plot(x_g,gumbelFx,'-.','linewidth',2,'color','r');
plot(x_g,gumbelFx_ME,'-','linewidth',2,'color','g');
hold off
%axis([6e5 9.5e5 0 1])
%legend('Heave','Location','southeast')
legend('Sample distribution','Gumbel- linear regression','Gumbel- method of momentum','Location','southeast')
xlabel('Maximum FA-moment [kNm]')
ylabel('CDF')
grid on
grid minor

%% calculate gumbel for points
%p=alpha_ME-beta_ME*log(-log(0.9))
end
