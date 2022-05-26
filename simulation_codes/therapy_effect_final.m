function [Rmax_1st,Rmax_3rd]=therapy_effect_final(p,dt,t_end,history_result_former)



T_former=0:dt:t_end;
%T_latter=t_end_former:dt:(t_end_former+t_end_latter);


%The maximum of R in the 1st antigen input
Rmax1_s=0;
Rmax1_e=p.ts_init1+p.duration1+p.ts_init2/2;
Rmax1_t=Rmax1_s:dt:Rmax1_e;
len_Rmax1_t=length(Rmax1_t);
R_1st_input=history_result_former(13,1:len_Rmax1_t);



%The maximum of R in the 3rd antigen input
Rmax3_s=p.ts_init1+p.duration1+p.ts_init2+p.duration2+p.ts_init3/2;
Rmax3_e=t_end;
Rmax3_t=Rmax3_s:dt:Rmax3_e;
len_Rmax3_t=length(Rmax3_t);
var_s_3=length(T_former)-len_Rmax3_t+1;
var_e_3=length(T_former);


R_3rd_input=history_result_former(13,var_s_3:var_e_3);




% if func_num==1
%     fig_name='linear function';
% elseif func_num==2
%     fig_name='sigmoid function';
% elseif func_num==3
%     fig_name='step function';
% end
% 
% 
% 
% figure
% subplot(2,1,1)
% plot(Rmax1_t,R_1st_input)
% title('1st input')
% 
% subplot(2,1,2)
% plot(Rmax3_t,R_3rd_input)
% title('3rd input')
% 
%  sgtitle(fig_name)
% 
Rmax_1st=max(R_1st_input);
Rmax_3rd=max(R_3rd_input);




end
