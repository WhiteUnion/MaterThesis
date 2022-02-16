function [gumbelFx_ME, p90, p95]=gumbel_ME_b(x)
x=sort(x);
Fx=cdf(x);
x_g=3e5:100:6.5e5;
% gumbel paper
y=-log(-log(Fx));

%% method of momentom
x_a=mean(x);
% y_a=mean(y);

x_v= std(x,1);

beta_ME= x_v/1.28255;
alpha_ME= x_a-0.57722*beta_ME;


% Method of momentum estimated line on Gumbel paper
ME_line =(1/beta_ME)*x-(alpha_ME/beta_ME);

%Gumbel distro
gumbelFx_ME= exp(-exp(-((x_g-alpha_ME)/beta_ME)));

%% calculate gumbel for points
p90=alpha_ME-beta_ME*log(-log(0.9));
p95=alpha_ME-beta_ME*log(-log(0.95));
end
