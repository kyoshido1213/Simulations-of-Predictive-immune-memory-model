function fig2_heatmap_result=fig2_heatmap_final(p,dt,t_end,q,antigen_list_heatmap,tau_up,K2_list,func_num)

a_len=length(antigen_list_heatmap);

heatmap_result_Th=zeros(length(K2_list),length(antigen_list_heatmap));
heatmap_result_Tr=zeros(length(K2_list),length(antigen_list_heatmap));
heatmap_result_R=zeros(length(K2_list),length(antigen_list_heatmap));
heatmap_result_Mh=zeros(length(K2_list),length(antigen_list_heatmap));
heatmap_result_Mr=zeros(length(K2_list),length(antigen_list_heatmap));



        for k=1:length(K2_list)

            K2=K2_list(k);
            conc_dep_heatmap=fig2_conc_dep_shrink_heatmap_final(p,dt,t_end,q,antigen_list_heatmap,tau_up,K2,func_num);



            heatmap_result_Th(k,:)=conc_dep_heatmap(1,:);
            heatmap_result_Tr(k,:)=conc_dep_heatmap(2,:);
            heatmap_result_R(k,:)=conc_dep_heatmap(5,:);
            heatmap_result_Mh(k,:)=conc_dep_heatmap(6,:);
            heatmap_result_Mr(k,:)=conc_dep_heatmap(7,:);




            k_pros=length(K2_list)-k;
            disp(['progress=',num2str(k_pros)])



        end
        
        
        fig2_heatmap_result=[heatmap_result_Th;heatmap_result_Tr;heatmap_result_R;heatmap_result_Mh;heatmap_result_Mr];
        
end

