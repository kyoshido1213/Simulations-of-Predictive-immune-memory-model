

%% common parameters
    clear

    p=get_para_final_for_check;

    dt=0.01;
    
    
%% Figure2
   
      func_num=1;%linear dose response

        %% time series simulation under high or low antigen concentrations (fig2A and B)

           
           tau_up=100;%common rapidness of antigen input
           t_end=10000;

          
             %% high antigen concentration (fig2A)

               antigen_satu=200;%antigen concentration(convergence value)
               high_dose_result=run_time_series_final(p,dt,t_end,antigen_satu,tau_up,func_num);

               %plot
               fig2_plot_time_series_final(high_dose_result,p,antigen_satu)


             

        %% antigen concenetration dependency (convergence value of intensity of response) (fig2D) 

            t_end=1000000/10;
            Antigen_list=0:1*30*10*2:500*5*10*2;

            q=10;%calculation shrink setting
            antigen_dependency_result=run_conc_dep_shrink_final(p,dt,t_end,q,Antigen_list,tau_up,p.K2,func_num);

            
            %plot
            fig2_plot_conc_dep_final(p,Antigen_list,antigen_dependency_result,func_num)
