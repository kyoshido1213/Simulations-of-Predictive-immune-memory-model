function [history_result_former,history_result_latter]=therapy_time_series_former_latter_final(t_end,dt,p,func_num_mTh,func_num_mTr,T_former,T_total)

     

        K_list=[p.K_linear,p.K_sig,p.K_step];
        n_list=[p.n_linear,p.n_sig,p.n_step];
        q_max_list=[p.q_max_linear,p.q_max_sig,p.q_max_step];


        
                history_result=therapy_time_series_final(p,t_end,dt,func_num_mTh,n_list,K_list,q_max_list,p.antigen_st2,func_num_mTr,p.tau_up2);
          

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