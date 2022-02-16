clear; 
clc; 

run part3_i.m;
diff_I=round((maxMy5_mean-maxMy5_406s_mean)./maxMy5_mean*100,1);
diff_II=round((maxMy5_mean-maxMy5H1H2_406s_mean)./maxMy5_mean*100,1);
                                                    
      LastName = {'101,121,141,161,181';'102,122,142,162,182';'103,123,143,163,183';'104,124,144,164,184';'105,125,145,165,185';'106,126,146,166,186';'107,127,147,167,187';'108,128,148,168,188';'109,129,149,169,189';'110,130,150,170,190';...
          '111,131,151,171,191';'112,132,152,172,192';'113,133,153,173,193';'114,134,154,174,194';'115,135,155,175,195';'116,136,156,176,196';'117,137,157,177,197';'118,138,158,178,198';'119,139,159,179,199';'120,140,160,180,200'};
      Reference = round(maxMy5_mean)';                                           %
      ApproachI = round(maxMy5_406s_mean)';                                    %
      DifferenceI = diff_I';                                        %
      ApproachII = round(maxMy5H1H2_406s_mean)'; 
      DifferenceII = diff_II'; 
      T = table(Reference,ApproachI,DifferenceI,ApproachII,DifferenceII);                              %
      T.Properties.RowNames = LastName;                                 %
      table2latex(T); 
