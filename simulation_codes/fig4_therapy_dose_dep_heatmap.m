function therapy_effect_result=fig4_therapy_dose_dep_heatmap(p,dt,t_end,func_num_mTh,func_num_mTr,n_list,K_list,q_max_list,antigen_st2_list,tau_up2)

   therapy_effect_list=zeros(1,length(antigen_st2_list));

       parfor i=1:length(antigen_st2_list)  

                %antigen concentration administered in immunotherapy
                antigen_st2_temp=antigen_st2_list(i);

                history_result=therapy_time_series_final(p,t_end,dt,func_num_mTh,n_list,K_list,q_max_list,antigen_st2_temp,func_num_mTr,tau_up2);
                %%fig4_plot_time_series_final(history_result,p,p.antigen_st2)

                %intensity
                [Rmax_1st,Rmax_3rd]=therapy_effect_final(p,dt,t_end,history_result);
                therapy_effect_list(i)=Rmax_3rd/Rmax_1st;

% %                 pros=length(antigen_st2_list)-i;
% %                 disp(num2str(pros))

       end

  therapy_effect_result=therapy_effect_list;

end
