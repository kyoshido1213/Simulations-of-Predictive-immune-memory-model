function [Th_satu,Tr_satu,R_satu,Mh_satu,Mr_satu]=fig3_heatmap_final(dt,q,antigen_list,tau_list,t_end,func_num,p,K_list,n_list,q_max_list)


heatmap_result_Th=zeros(length(tau_list),length(antigen_list));
heatmap_result_Tr=zeros(length(tau_list),length(antigen_list));
heatmap_result_R=zeros(length(tau_list),length(antigen_list));
heatmap_result_Mh=zeros(length(tau_list),length(antigen_list));
heatmap_result_Mr=zeros(length(tau_list),length(antigen_list));



for a_num=1:length(antigen_list)

    
        antigen_satu=antigen_list(a_num);

        result_satu=fig3_dynamics_dep_shrink_final(p,dt,t_end,q,K_list,n_list,q_max_list,antigen_satu,func_num,tau_list,p.K2);
        %result_satu=[Th_satu;Tr_satu;mTh_satu;mTr_satu;R_satu;Mh_satu;Mr_satu];

        Th_satu=result_satu(1,:);
        Tr_satu=result_satu(2,:);
        R_satu=result_satu(5,:);
        Mh_satu=result_satu(6,:);
        Mr_satu=result_satu(7,:);
        
        
        heatmap_result_Th(:,a_num)=Th_satu;
        heatmap_result_Tr(:,a_num)=Tr_satu;
        heatmap_result_R(:,a_num)=R_satu;
        heatmap_result_Mh(:,a_num)=Mh_satu;
        heatmap_result_Mr(:,a_num)=Mr_satu;
        
        pros_num=length(antigen_list)-a_num;
        disp(['progress=',num2str(pros_num)])
     
        
        
end

    Th_satu=heatmap_result_Th;
    Tr_satu=heatmap_result_Tr;
    R_satu=heatmap_result_R;
    Mh_satu=heatmap_result_Mh;
    Mr_satu=heatmap_result_Mr;
    


end
