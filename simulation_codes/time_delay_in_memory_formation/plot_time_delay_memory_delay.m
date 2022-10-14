clear

%% common parameters
    clear

    p=get_para_final;

    dt=0.01;

    
    delay_time_list=[0,10,50];
    
    
for d_num=2:3   
    
    delayed_time=delay_time_list(d_num);
    
        %% Figure2

              func_num=1;%linear dose response

                %% time series simulation under high or low antigen concentrations (fig2A and B)


                   tau_up=100;%common rapidness of antigen input
                   t_end=10000;

                   high_dose_result=importdata(['high_dose_result_delay_',num2str(delayed_time),'.mat']);
                   low_dose_result=importdata(['low_dose_result_delay_',num2str(delayed_time),'.mat']);

% % %                        %plot
% % %                        antigen_satu=200;
% % %                        fig2_plot_time_series_final_timedelay(high_dose_result,p,antigen_satu,delayed_time)
                       
% % %                        antigen_satu=20;
% % %                        fig2_plot_time_series_final_timedelay(low_dose_result,p,antigen_satu,delayed_time)

                       
                       
                 %% antigen concenetration dependency (convergence value of intensity of response) (fig2D) 

                    t_end=1000000/10;%%%%%%%%変更の必要あり%%%%%%%%
                    Antigen_list=0:1:500;%%%%%%%%変更の必要あり%%%%%%%%  
                    
                    antigen_dependency_result=importdata(['antigen_dependency_result_delay_',num2str(delayed_time),'.mat']);

% % % %                     %plot
% % % %                     fig2_plot_conc_dep_final_timedelay(p,Antigen_list,antigen_dependency_result,func_num,delayed_time)
                    
                    
            
                    %% time series simulation under rapid or slow antigen rapidness (fig3A and B)   
                               func_num=1;%linear dose-response
                               antigen_satu=200;%common antigen concentration
                               t_end=10000;
                               
                               rapid_dose_result=importdata(['rapid_dose_result_delay_',num2str(delayed_time),'.mat']);
                               slow_dose_result=importdata(['slow_dose_result_delay_',num2str(delayed_time),'.mat']);



% % % %                          %plot
% % % %                          tau_up_temp=100;
% % % %                          fig3_plot_time_series_final_timedelay(rapid_dose_result,p,tau_up_temp,delayed_time)
% % % %                          
% %                          tau_up_temp=1000;
% %                          fig3_plot_time_series_final_timedelay(slow_dose_result,p,tau_up_temp,delayed_time)
% % % % 
% % % % 
                   %% input rapidness dependency (convergence value of intensity of response) (fig3c)

                                tic
                                antigen_satu=200;
                                t_end=1000000/10;%%%%%%%%変更の必要あり%%%%%%%%

                                tau_list=1:5:1501;%%%%%%%%変更の必要あり%%%%%%%%
                                
                                tau_result_satu=importdata(['tau_result_satu_delay_',num2str(delayed_time),'.mat']);
                                

                                %plot
                                plot_input_dynamics_final_timedelay(tau_list,tau_result_satu,delayed_time)

end

                     