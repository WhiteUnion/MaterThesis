
clear; 
clc; 
load('simu1hour.mat')
load('my_max.mat')
load('startTime.mat')
                                             
      LastName = string((1:100))';
      Seeds= (101:200)';                                           %
      maxFA = round(max(my),-1)';                                    %
      FA_Hmax = round(my_maxH,-1)';
      sT406 = (startTimeH_406s./10)';
      FA_406 = round(myH406s,-1)'; 
      FA_H1H2max = round(my_maxH1H2,-1)';
      sT406H2 = (startTimeH1H2_406s./10)';
      FA_406H2 = round(myH1H2406s,-1)';
      T = table(Seeds,maxFA,FA_Hmax,sT406,FA_406,FA_H1H2max,sT406H2,FA_406H2);                              %
      T.Properties.RowNames = LastName;                                 %
      table2latex(T); 