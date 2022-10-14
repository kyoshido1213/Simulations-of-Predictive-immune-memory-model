function therapy_effect_result=fig4_therapy_dose_dep_heatmap(p,dt,t_end,antigen_st2_list,tau_up2,func_num_Th,func_num_Tr)

   therapy_effect_list=zeros(1,length(antigen_st2_list));

       parfor i=1:length(antigen_st2_list)  

                %antigen concentration administered in immunotherapy
                antigen_st2_temp=antigen_st2_list(i);

                history_result=therapy_time_series_final(p,t_end,dt,antigen_st2_temp,tau_up2,func_num_Th,func_num_Tr);
                %%fig4_plot_time_series_final(history_result,p,p.antigen_st2)

                %intensity
                [Rmax_1st,Rmax_3rd]=therapy_effect_final(p,dt,t_end,history_result);
                therapy_effect_list(i)=Rmax_3rd/Rmax_1st;

% %                 pros=length(antigen_st2_list)-i;
% %                 disp(num2str(pros))

       end

  therapy_effect_result=therapy_effect_list;

end



f