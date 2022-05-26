%%% all simulations in fig2-5 and Sfig1-2 %%%

%% common parameters
    clear

    p=get_para_final_new;

    dt=0.01;

    K_list=[p.K_linear,p.K_sig,p.K_step];
    n_list=[p.n_linear,p.n_sig,p.n_step];
    q_max_list=[p.q_max_linear,p.q_max_sig,p.q_max_step];

    
%% Figure2

        %% time series simulation under high or low antigen concentrations (fig2A and B)

           func_num=1;%linear dose-response
           tau_up=100;%common rapidness of antigen input
           t_end=10000;


             %% high antigen concentration (fig2A)

               antigen_satu=200;%antigen concentration(convergence value)
               high_dose_result=run_time_series_final(p,dt,t_end,antigen_satu,tau_up,func_num,n_list,K_list,q_max_list);

               %plot
               fig2_plot_time_series_final(high_dose_result,p,antigen_satu)

             %% low antigen concentration (fig2B)

               antigen_satu=20;%antigen concentration(convergence value)
               high_dose_result=run_time_series_final(p,dt,t_end,antigen_satu,tau_up,func_num,n_list,K_list,q_max_list);

               %plot
               fig2_plot_time_series_final(high_dose_result,p,antigen_satu)


        %% antigen concenetration dependency (convergence value of intensity of response) (fig2D)

            t_end=1000000;
            Antigen_list=0:1:500;

            q=10;%calculation shrink setting
            antigen_dependency_result=run_conc_dep_shrink_final(p,dt,t_end,q,K_list,n_list,q_max_list,Antigen_list,func_num,tau_up,p.K2);

            %plot
            fig2_plot_conc_dep_final(p,Antigen_list,antigen_dependency_result,func_num)


        %% dependency of steady state response on antigen concentration and a parameter K in predictive coding (fig2e)
        
            %common parameters
            func_num=1;
            tau_up=100;
            q=10;

            %% antigen=0~3 (t_end=100000*10*10 for convergence)
            antigen_list_heatmap_1=0:1:3;
            K2_list_1=0:1:150;
            t_end_1=100000*10*10;

            heatmap_result_1=fig2_heatmap_final(p,dt,t_end_1,q,K_list,n_list,q_max_list,antigen_list_heatmap_1,func_num,tau_up,K2_list_1);
            
      
            %% antigen=4~16 (t_end=100000*10 for convergenece)
            antigen_list_heatmap_2=4:1:16;
            K2_list_2=0:1:150;
            t_end_2=100000*10;

            heatmap_result_2=fig2_heatmap_final(p,dt,t_end_2,q,K_list,n_list,q_max_list,antigen_list_heatmap_2,func_num,tau_up,K2_list_2);
            
           
            %% antigen=17~200 (t_end=100000 for convergence)
            antigen_list_heatmap_3=17:1:200;
            K2_list_3=0:1:150;
            t_end_3=100000;

            heatmap_result_3=fig2_heatmap_final(p,dt,t_end_3,q,K_list,n_list,q_max_list,antigen_list_heatmap_3,func_num,tau_up,K2_list_3);
            
            %% integration
            antigen_list_heatmap=[antigen_list_heatmap_1 antigen_list_heatmap_2 antigen_list_heatmap_1];
            K2_list=[K2_list_1 K2_list_2 K2_list_3];

            fig2_heatmap_result_Th=[heatmap_result_1(:,:,1) heatmap_result_2(:,:,1) heatmap_result_3(:,:,1)];
            fig2_heatmap_result_Tr=[heatmap_result_1(:,:,2) heatmap_result_2(:,:,2) heatmap_result_3(:,:,2)];
            fig2_heatmap_result_R=[heatmap_result_1(:,:,3) heatmap_result_2(:,:,3) heatmap_result_3(:,:,3)];

            fig2_heatmap_result_Mh=[heatmap_result_1(:,:,4) heatmap_result_2(:,:,4) heatmap_result_3(:,:,4)];
            fig2_heatmap_result_Mr=[heatmap_result_1(:,:,5) heatmap_result_2(:,:,5) heatmap_result_3(:,:,5)];

            %plot
            fig2_heatmap_plot_final(fig2_heatmap_result_Th,fig2_heatmap_result_Tr,fig2_heatmap_result_R,fig2_heatmap_result_Mh,fig2_heatmap_result_Mr)


%% Figure3 

        %% time series simulation under rapid or slow antigen rapidness (fig3A and B)   
           func_num=1;%linear dose-response
           antigen_satu=200;%common antigen concentration
           t_end=10000;

           %% high antigen concentration with rapid increase

             tau_up_temp=100;
             rapid_dose_result=run_time_series_final(p,dt,t_end,antigen_satu,tau_up_temp,func_num,n_list,K_list,q_max_list);

             %plot
             fig3_plot_time_series_final(rapid_dose_result,p,tau_up_temp)  

           %% high dose(time series) with slow increase%%%  

             tau_up_temp=1000;
             slow_dose_result=run_time_series_final(p,dt,t_end,antigen_satu,tau_up_temp,func_num,n_list,K_list,q_max_list);

             %plot
             fig3_plot_time_series_final(slow_dose_result,p,tau_up_temp)  


        %% input rapidness dependency (convergence value of intensity of response) (fig3c)
        
            tic
            antigen_satu=200;
            t_end=1000000;
            func_num=1;

            q=10;
            tau_list=1:1:1500;
            tau_result_satu=fig3_dynamics_dep_shrink_final(p,dt,t_end,q,K_list,n_list,q_max_list,antigen_satu,func_num,tau_list,p.K2);

          
            %plot
            plot_input_dynamics_final(tau_list,tau_result_satu)
            
            toc

            
            %% dependency of steady state response on antigen concentration and input rapidness (fig3d)
        
            antigen_satu_list=0:1:500;
            tau_list=1:1:1000;
            func_num=1;
            q=10;
            
            %% antigen=16~500(t_end=t_end=10000 for convergence)
            
            antigen_satu_list_1=16:1:500;
            t_end=10000;
            
            [heatmap_result_Th_1,heatmap_result_Tr_1,heatmap_result_R_1,heatmap_result_Mh_1,heatmap_result_Mr_1]=fig3_heatmap_final(dt,q,antigen_satu_list_1,tau_list,t_end,func_num,p,K_list,n_list,q_max_list);

            %% antigen=5~15(t_end=t_end=10000*10 for convergence)

            antigen_satu_list_2=5:1:15;
            t_end=10000*10;
            
            [heatmap_result_Th_2,heatmap_result_Tr_2,heatmap_result_R_2,heatmap_result_Mh_2,heatmap_result_Mr_2]=fig3_heatmap_final(dt,q,antigen_satu_list_2,tau_list,t_end,func_num,p,K_list,n_list,q_max_list);
            
            
            %% antigen=0~4(t_end=t_end=10000*10*10 for convergence)

            antigen_satu_list_3=0:1:4;
            t_end=10000*10*10;
      
            [heatmap_result_Th_3,heatmap_result_Tr_3,heatmap_result_R_3,heatmap_result_Mh_3,heatmap_result_Mr_3]=fig3_heatmap_final(dt,q,antigen_satu_list_3,tau_list,t_end,func_num,p,K_list,n_list,q_max_list);
            
            %% integration
            heatmap_result_Th=[heatmap_result_Th_3 heatmap_result_Th_2 heatmap_result_Th_1];
            heatmap_result_Tr=[heatmap_result_Tr_3 heatmap_result_Tr_2 heatmap_result_Tr_1];
            heatmap_result_R=[heatmap_result_R_3 heatmap_result_R_2 heatmap_result_R_1];
            heatmap_result_Mh=[heatmap_result_Mh_3 heatmap_result_Mh_2 heatmap_result_Mh_1];
            heatmap_result_Mr=[heatmap_result_Mr_3 heatmap_result_Mr_2 heatmap_result_Mr_1];
            
            %plot
            fig3_plot_heatmap(heatmap_result_Th,heatmap_result_Tr,heatmap_result_R,heatmap_result_Mh,heatmap_result_Mr)

           
%% Figure4

        %% time series in allergen immunotherapy(fig4A)
          p=get_para_final_new;  
         
          func_num_mTh=1;
          func_num_mTr=1;
          
          t_end=p.ts_init1+p.duration1+...
                p.ts_init2+p.duration2+...
                p.ts_init3+p.duration3+...
                p.ts_init1;

            %% therapy by low dose administration

                antigen_st2=20;
                history_result_low=therapy_time_series_final(p,t_end,dt,func_num_mTh,n_list,K_list,q_max_list,antigen_st2,func_num_mTr,p.tau_up2);
                %plot
                fig4_plot_time_series_final(history_result_low,p,antigen_st2)
    

            %% dependency of therapeutic effect on antigen concentration in therapy (fig4B)
             
               p=get_para_final_new_fig4;
               t_end=p.ts_init1+p.duration1+...
                  p.ts_init2+p.duration2+...
                  p.ts_init3+p.duration3+...
                  p.ts_init1;
               
               
               antigen_st2_list=0:1:200;

               therapy_effect_list=fig4_therapy_dose_dep_heatmap(p,dt,t_end,func_num_mTh,func_num_mTr,n_list,K_list,q_max_list,antigen_st2_list,p.tau_up2);


                %plot
                figure
                subplot(2,2,1)
                plot(antigen_st2_list,therapy_effect_list,'Color','m','LineWidth',5)
                xlabel('antigen concentration administered in therapy')
                ylabel('3rd intensity/1st intensity')


          %% dependency of therapeutic effect on antigen concentration and input rapiddness in therapy (fig4C)

            p=get_para_final_new_fig4;
            %%These parameters are different from "get_para_final_new.m" only in terms of parameters of antigen input%%
            
            t_end=p.ts_init1+p.duration1+...
                  p.ts_init2+p.duration2+...
                  p.ts_init3+p.duration3+...
                  p.ts_init1;

            antigen_st2_list=0:1:200;
            tau_list=1:1:250;

            therapy_effect_heatmap=zeros(length(tau_list),length(antigen_st2_list));

            for i=1:length(tau_list)

                tau_up2_temp=tau_list(i);
                therapy_effect_list=fig4_therapy_dose_dep_heatmap(p,dt,t_end,func_num_mTh,func_num_mTr,n_list,K_list,q_max_list,antigen_st2_list,tau_up2_temp);


                therapy_effect_heatmap(i,:)=therapy_effect_list;

                pros=length(tau_list)-i;
                disp(['progress=',num2str(pros)])    

            end


            figure
            imagesc(therapy_effect_heatmap)
            xlabel('antigen dose administered in therapy')
            ylabel('tau in therapy')
            axis xy
            title('3rd intensity/1st intensity')
            ax=gca;
            ax.FontSize=30;




%% Figure5
        p=get_para_final_new_fig5;
        %%These parameters are different from "get_para_final_new.m" only in terms of parameters of antigen input%%
        
      %% steady state response (convergence value of memory T cell and intensity) (Fig5B,E,H)
  
           Antigen_list=0:1:500;
           q=10;%calculation shrink setting
           tau_up=100;

           %% linear dose-response (Fig5B)←simulated in Fig2C

           %% sigmoid dose-response (Fig5E)
               %antigen=0~7:t_end=1000000*10*10,antigen=8~13:t_end=1000000*10,antigen=14~500:t_end=1000000
               tic
               func_num=2;%%Th and Tr have same dose-response type
               
               %% antigen=0~7 (t_end=1000000*10*10 for convergence)
               Antigen_list_1=0:1:7;
               t_end=1000000*10*10*10;
               antigen_dependency_result_1=run_conc_dep_shrink_final(p,dt,t_end,q,K_list,n_list,q_max_list,Antigen_list_1,func_num,tau_up,p.K2);
               
              
               %% antigen=8~13 (t_end=1000000*10 for convergence)
               Antigen_list_2=8:1:13;
               t_end=1000000*10;
               antigen_dependency_result_2=run_conc_dep_shrink_final(p,dt,t_end,q,K_list,n_list,q_max_list,Antigen_list_2,func_num,tau_up,p.K2);
               
    
               %% antigen=14~500 (t_end=1000000 for convergence)
               Antigen_list_3=14:1:500;
               t_end=1000000;
               antigen_dependency_result_3=run_conc_dep_shrink_final(p,dt,t_end,q,K_list,n_list,q_max_list,Antigen_list_3,func_num,tau_up,p.K2);
               
  
               %% integration
               antigen_dependency_result=[antigen_dependency_result_1 antigen_dependency_result_2 antigen_dependency_result_3];
               
               %plot
               fig2_plot_conc_dep_final(p,Antigen_list,antigen_dependency_result,func_num)
               
               toc

           %% step dose-response (Fig5H)
           
           tic
           func_num=3;%%Th and Tr have same dose-response type
           
           
           %% antigen=0~6 (t_end=1000000*10*10 for convergence)
           Antigen_list_1=0:1:6;
           t_end=1000000*10*10;
           antigen_dependency_result_1=run_conc_dep_shrink_final(p,dt,t_end,q,K_list,n_list,q_max_list,Antigen_list_1,func_num,tau_up,p.K2);
          
           
           %% antigen=7~500 (t_end=1000000 for convergence)
           Antigen_list_2=7:1:500;
           t_end=1000000;
           antigen_dependency_result_2=run_conc_dep_shrink_final(p,dt,t_end,q,K_list,n_list,q_max_list,Antigen_list_2,func_num,tau_up,p.K2);
 
           %% integration
           antigen_dependency_result=[antigen_dependency_result_1 antigen_dependency_result_2];
           
           %plot
           fig2_plot_conc_dep_final(p,Antigen_list,antigen_dependency_result,func_num)
           toc

       %% time-series of immunotherapy in each dose-response (Fig5C,F,I)

              %history dependent%
              t_end_former=p.ts_init1+p.duration1+...
                           p.ts_init2+p.duration2+...
                           p.ts_init3+p.duration3+...
                           p.ts_init4/2;
              t_end_latter=p.ts_init4/2+p.duration4+...
                           p.ts_init5  +p.duration5+...
                           p.ts_init1;

              t_end=t_end_former+t_end_latter;

              T_former=0:dt:t_end_former;
              T_latter=t_end_former:dt:(t_end_former+t_end_latter);
              T_total=0:dt:(t_end_former+t_end_latter);


                %linear function
                func_num_mTh=1;func_num_mTr=1;
                [history_result_linear_former,history_result_linear_latter]=therapy_time_series_former_latter_final(t_end,dt,p,func_num_mTh,func_num_mTr,T_former,T_total);

                %sigmoid function
                func_num_mTh=2;func_num_mTr=2;
                [history_result_sig_former,history_result_sig_latter]=therapy_time_series_former_latter_final(t_end,dt,p,func_num_mTh,func_num_mTr,T_former,T_total);

                %step function
                func_num_mTh=3;func_num_mTr=3;
                [history_result_step_former,history_result_step_latter]=therapy_time_series_former_latter_final(t_end,dt,p,func_num_mTh,func_num_mTr,T_former,T_total);

            %plot
            fig5_plot_time_series(history_result_linear_former,history_result_linear_latter,history_result_sig_former,history_result_sig_latter,history_result_step_former,history_result_step_latter)





%% FigureS1

      p=get_para_final_new_fig5;

      t_end_former=p.ts_init1+p.duration1+...
                   p.ts_init2+p.duration2+...
                   p.ts_init3+p.duration3+...
                   p.ts_init4/2;
      t_end_latter=p.ts_init4/2+p.duration4+...
                   p.ts_init5  +p.duration5+...
                   p.ts_init1;

      t_end=t_end_former+t_end_latter;

      T_former=0:dt:t_end_former;
      T_latter=t_end_former:dt:(t_end_former+t_end_latter);
      T_total=0:dt:(t_end_former+t_end_latter);
      
      %% Tr dose-response:linear
      func_num_mTr=1;
      
          % Th dose-response:linear
            func_num_mTh=1;
            [history_result_linear_former,history_result_linear_latter]=therapy_time_series_former_latter_final(t_end,dt,p,func_num_mTh,func_num_mTr,T_former,T_total);

          %sigmoid function
            func_num_mTh=2;
            [history_result_sig_former,history_result_sig_latter]=therapy_time_series_former_latter_final(t_end,dt,p,func_num_mTh,func_num_mTr,T_former,T_total);

          %step function
            func_num_mTh=3;
            [history_result_step_former,history_result_step_latter]=therapy_time_series_former_latter_final(t_end,dt,p,func_num_mTh,func_num_mTr,T_former,T_total);

          %plot
            S_fig1_plot_dose_response_each_fig_final(history_result_linear_former,history_result_linear_latter,history_result_sig_former,history_result_sig_latter,history_result_step_former,history_result_step_latter,func_num_mTr)
            
       %% Tr dose-response:sigmoid
       func_num_mTr=2;
      
          % Th dose-response:linear
            func_num_mTh=1;
            [history_result_linear_former,history_result_linear_latter]=therapy_time_series_former_latter_final(t_end,dt,p,func_num_mTh,func_num_mTr,T_former,T_total);

          %sigmoid function
            func_num_mTh=2;
            [history_result_sig_former,history_result_sig_latter]=therapy_time_series_former_latter_final(t_end,dt,p,func_num_mTh,func_num_mTr,T_former,T_total);

          %step function
            func_num_mTh=3;
            [history_result_step_former,history_result_step_latter]=therapy_time_series_former_latter_final(t_end,dt,p,func_num_mTh,func_num_mTr,T_former,T_total);

          %plot
            S_fig1_plot_dose_response_each_fig_final(history_result_linear_former,history_result_linear_latter,history_result_sig_former,history_result_sig_latter,history_result_step_former,history_result_step_latter,func_num_mTr)
            
            
       %% Tr dose-response:step
       func_num_mTr=3;
      
          % Th dose-response:linear
            func_num_mTh=1;
            [history_result_linear_former,history_result_linear_latter]=therapy_time_series_former_latter_final(t_end,dt,p,func_num_mTh,func_num_mTr,T_former,T_total);

          %sigmoid function
            func_num_mTh=2;
            [history_result_sig_former,history_result_sig_latter]=therapy_time_series_former_latter_final(t_end,dt,p,func_num_mTh,func_num_mTr,T_former,T_total);

          %step function
            func_num_mTh=3;
            [history_result_step_former,history_result_step_latter]=therapy_time_series_former_latter_final(t_end,dt,p,func_num_mTh,func_num_mTr,T_former,T_total);

          %plot
            S_fig1_plot_dose_response_each_fig_final(history_result_linear_former,history_result_linear_latter,history_result_sig_former,history_result_sig_latter,history_result_step_former,history_result_step_latter,func_num_mTr)
            
            
            
%% FigureS2
 
    t_end_former=p.ts_init1+p.duration1+...
                 p.ts_init2+p.duration2+...
                 p.ts_init3+p.duration3+...
                 p.ts_init4/2;
    t_end_latter=p.ts_init4/2+p.duration4+...
                 p.ts_init5  +p.duration5+...
                 p.ts_init1;

    t_end=t_end_former+t_end_latter;

    T_former=0:dt:t_end_former;
    T_latter=t_end_former:dt:(t_end_former+t_end_latter);
    T_total=0:dt:(t_end_former+t_end_latter);



    therapy_effect_matrix=zeros(3,3);
    persistency_matrix=zeros(3,3);

        for i=1:3

                    %%%ここでmTrの活性化様式を変更
                    func_num_mTr=i;



                    %linear function
                    func_num_mTh=1;
                    [history_result_linear_former,history_result_linear_latter]=therapy_time_series_former_latter_final(t_end,dt,p,func_num_mTh,func_num_mTr,T_former,T_total);


                    %sigmoid function
                    func_num_mTh=2;
                    [history_result_sig_former,history_result_sig_latter]=therapy_time_series_former_latter_final(t_end,dt,p,func_num_mTh,func_num_mTr,T_former,T_total);



                    %step function
                    func_num_mTh=3;
                    [history_result_step_former,history_result_step_latter]=therapy_time_series_former_latter_final(t_end,dt,p,func_num_mTh,func_num_mTr,T_former,T_total);




                    %%the effect of therapy
                    %linear
                    func_num=1;
                    [Rmax_1st_linear,Rmax_3rd_linear,Rmax_5th_linear]=S_fig2_therapy_effect_final(p,dt,t_end_former,t_end_latter,history_result_linear_former,history_result_linear_latter,func_num);

                    %sigmoid
                    func_num=2;
                    [Rmax_1st_sig,Rmax_3rd_sig,Rmax_5th_sig]=S_fig2_therapy_effect_final(p,dt,t_end_former,t_end_latter,history_result_sig_former,history_result_sig_latter,func_num);

                    %step
                    func_num=3;
                    [Rmax_1st_step,Rmax_3rd_step,Rmax_5th_step]=S_fig2_therapy_effect_final(p,dt,t_end_former,t_end_latter,history_result_step_former,history_result_step_latter,func_num);




                    %%the effect of therapyの計算
                    %linear
                    therapy_linear=Rmax_3rd_linear/Rmax_1st_linear;
                    persistency_linear=Rmax_5th_linear/Rmax_3rd_linear;

                    %sigmoid
                    therapy_sig=Rmax_3rd_sig/Rmax_1st_sig;
                    persistency_sig=Rmax_5th_sig/Rmax_3rd_sig;

                    %step
                    therapy_step=Rmax_3rd_step/Rmax_1st_step;
                    persistency_step=Rmax_5th_step/Rmax_3rd_step;




                    therapy_effect_matrix(1,i)=therapy_linear;
                    therapy_effect_matrix(2,i)=therapy_sig;
                    therapy_effect_matrix(3,i)=therapy_step;

                    persistency_matrix(1,i)=persistency_linear;
                    persistency_matrix(2,i)=persistency_sig;
                    persistency_matrix(3,i)=persistency_step;





        end


        %plot
        figure
        xvalues={'Tr:linear','Tr:sigmoid','Tr:step'};
        yvalues={'Th:linear','Th:sigmoid','Th:step'};
        heatmap(xvalues,yvalues,therapy_effect_matrix)
        title('therapy effect')
        caxis([-3,5])
        colormap('redblue');
        colorbar;
        f = gcf;
        set(gcf,'renderer','painters')
        

        figure
        xvalues={'Tr:linear','Tr:sigmoid','Tr:step'};
        yvalues={'Th:linear','Th:sigmoid','Th:step'};
        heatmap(xvalues,yvalues,persistency_matrix)
        title('persistency')
        caxis([-3,5])
        colormap('redblue');
        colorbar;
        f = gcf;
        set(gcf,'renderer','painters')
