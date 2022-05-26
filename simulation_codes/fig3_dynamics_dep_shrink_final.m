function result_satu=fig3_dynamics_dep_shrink_final(p,dt,t_end,q,K_list,n_list,q_max_list,antigen_satu,func_num,tau_list,K2)


Th_satu=zeros(1,length(tau_list));
Tr_satu=zeros(1,length(tau_list));
mTh_satu=zeros(1,length(tau_list));
mTr_satu=zeros(1,length(tau_list));
R_satu=zeros(1,length(tau_list));
Mh_satu=zeros(1,length(tau_list));
Mr_satu=zeros(1,length(tau_list));


parfor ka=1:length(tau_list)
    
    tau_up=tau_list(ka);
    shrink_result=shrink_pre_final(p,dt,t_end,antigen_satu,tau_up,func_num,n_list,K_list,q_max_list,q,K2);
    %shrink_result=[T_result;Th_result;Tr_result;mTh_result;mTr_result;A_result;R_result;Mh_result;Mr_result];
        
    Th_satu(ka)=shrink_result(2,end);
    Tr_satu(ka)=shrink_result(3,end);
    mTh_satu(ka)=shrink_result(4,end);
    mTr_satu(ka)=shrink_result(5,end);
    R_satu(ka)=shrink_result(7,end);
    Mh_satu(ka)=shrink_result(8,end);
    Mr_satu(ka)=shrink_result(9,end);
    
   
end

result_satu=[Th_satu;Tr_satu;mTh_satu;mTr_satu;R_satu;Mh_satu;Mr_satu];


end


