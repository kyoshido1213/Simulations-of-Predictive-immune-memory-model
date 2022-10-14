function [history_result_former,history_result_latter]=therapy_time_series_former_latter_final(t_end,dt,p,func_num_Th,func_num_Tr,T_former,T_total)

     

                history_result=therapy_time_series_final(p,t_end,dt,p.antigen_st2,p.tau_up2,func_num_Th,func_num_Tr);
                                                         

                [len_f_sub,len_f]=size(T_former);
                [len_t_sub,len_t]=size(T_total);

                history_result_former=zeros(13,len_f);
                history_result_latter=zeros(13,len_t-len_f);


                for k=1:len_f
                    history_result_former(:,k)=history_result(:,k);
                end



                for k=len_f:len_t
                    history_result_latter(:,(k-len_f+1))=history_result(:,k);
                end



end


