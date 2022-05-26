function result_satu=run_conc_dep_shrink_final(p,dt,t_end,q,K_list,n_list,q_max_list,antigen_list,func_num,tau_up,K2)


Th_satu=zeros(1,length(antigen_list));
Tr_satu=zeros(1,length(antigen_list));
mTh_satu=zeros(1,length(antigen_list));
mTr_satu=zeros(1,length(antigen_list));
R_satu=zeros(1,length(antigen_list));
Mh_satu=zeros(1,length(antigen_list));
Mr_satu=zeros(1,length(antigen_list));

len_antigen_list=length(antigen_list);

parfor ka=1:length(antigen_list)
    
    antigen_satu=antigen_list(ka);
    shrink_result=shrink_pre_final(p,dt,t_end,antigen_satu,tau_up,func_num,n_list,K_list,q_max_list,q,K2);
    %shrink_result=[T_result;Th_result;Tr_result;mTh_result;mTr_result;A_result;R_result;Mh_result;Mr_result];
    
    Th_satu(ka)=shrink_result(2,end);
    Tr_satu(ka)=shrink_result(3,end);
    mTh_satu(ka)=shrink_result(4,end);
    mTr_satu(ka)=shrink_result(5,end);
    R_satu(ka)=shrink_result(7,end);
    Mh_satu(ka)=shrink_result(8,end);
    Mr_satu(ka)=shrink_result(9,end);
    
    
    
    pros=len_antigen_list-ka;
    disp(pros)

end

result_satu=[Th_satu;Tr_satu;mTh_satu;mTr_satu;R_satu;Mh_satu;Mr_satu];

end


