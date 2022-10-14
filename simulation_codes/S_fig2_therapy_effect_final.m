function [Rmax_1st,Rmax_3rd,Rmax_5th]=S_fig2_therapy_effect_final(p,dt,t_end_former,t_end_latter,history_result_former,history_result_latter)

T_former=0:dt:t_end_former;
T_latter=t_end_former:dt:(t_end_former+t_end_latter);


%The maximum of R in the 1st antigen input
Rmax1_s=0;
Rmax1_e=p.ts_init1+p.duration1+p.ts_init2/2;
Rmax1_t=Rmax1_s:dt:Rmax1_e;
len_Rmax1_t=length(Rmax1_t);
R_1st_input=history_result_former(13,1:len_Rmax1_t);



%The maximum of R in the 3rd antigen input
Rmax3_s=p.ts_init1+p.duration1+p.ts_init2+p.duration2+p.ts_init3/2;
Rmax3_e=t_end_former;
Rmax3_t=Rmax3_s:dt:Rmax3_e;
len_Rmax3_t=length(Rmax3_t);
var_s_3=length(T_former)-len_Rmax3_t+1;
var_e_3=length(T_former);


R_3rd_input=history_result_former(13,var_s_3:var_e_3);


%The maximum of R in the 5th antigen input
rr=p.ts_init1+p.duration1+p.ts_init2+p.duration2+p.ts_init3+p.duration3;
Rmax5_s=t_end_former+(p.ts_init4-(t_end_former-rr)+p.duration4+p.ts_init5/2);
Rmax5_e=t_end_former+t_end_latter;
Rmax5_t=Rmax5_s:dt:Rmax5_e;
len_Rmax5_t=length(Rmax5_t);
var_s_5=length(T_latter)-len_Rmax5_t+1;
var_e_5=length(T_latter);
R_5th_input=history_result_latter(13,var_s_5:var_e_5);


Rmax_1st=max(R_1st_input);
Rmax_3rd=max(R_3rd_input);
Rmax_5th=max(R_5th_input);



end

