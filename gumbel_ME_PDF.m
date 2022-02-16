function [gumbel_fx]=gumbel_ME_PDF(x)
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

%Gumbel distro PDF
% parameter z
z=(x_g-alpha_ME)/beta_ME;
gumbel_fx=(1/beta_ME)*exp(-(z+exp(-z)));

end
