%%% all simulations in fig2-5 and Sfig1-2 %%%

%%delay_time_list=[10,50,100,500];


            %% common parameters
                clear

                p=get_para_final;

                dt=0.01;

            %% parameter of time delay

                delayed_time=10;
                tau_delay=delayed_time/dt;%time delay of memory generation

            %% Figure2

                  func_num=1;%linear dose response

                    %% time series simulation under high or low antigen concentrations (fig2A and B)


                       tau_up=100;%common rapidness of antigen input
                       t_end=10000;


                         %% high antigen concentration (fig2A)

                           antigen_satu=200;%antigen concentration(convergence value)
                           high_dose_result=importdata(['high_dose_result_delay_',num2str(delayed_time),'.mat']);

                           %plot
                           fig2_plot_time_series_final_timedelay(high_dose_result,p,antigen_satu,delayed_time)

                          
                         %% low antigen concentration (fig2B)

                           antigen_satu=20;%antigen concentration(convergence value)
                           low_dose_result=importdata(['low_dose_result_delay_',num2str(delayed_time),'.mat']);

                           %plot
                           fig2_plot_time_series_final_timedelay(low_dose_result,p,antigen_satu,delayed_time)

                    %% antigen concenetration dependency (convergence value of intensity of response) (fig2D) 
                        
                        t_end=1000000;%%%%%%%%変更の必要あり%%%%%%%%
                        Antigen_list=0:1:500;%%%%%%%%変更の必要あり%%%%%%%%

                        antigen_dependency_result=importdata(['antigen_dependency_result_delay_',num2str(delayed_time),'.mat']);

                        %plot
                        fig2_plot_conc_dep_final_timedelay(p,Antigen_list,antigen_dependency_result,func_num,delayed_time)
%                         save(['antigen_dependency_result_delay_',num2str(delayed_time)],'antigen_dependency_result')
% 


            %% Figure3 
                    
            %% time series simulation under rapid or slow antigen rapidness (fig3A and B)   
                       
                       func_num=1;%linear dose-response
                       antigen_satu=200;%common antigen concentration
                       t_end=10000;

                       %% high antigen concentration with rapid increase

                         tau_up_temp=100;
                         rapid_dose_result=importdata(['rapid_dose_result_delay_',num2str(delayed_time),'.mat']);

                         %plot
                         fig3_plot_time_series_final_timedelay(rapid_dose_result,p,tau_up_temp,delayed_time)
% %                           save(['rapid_dose_result_delay_',num2str(delayed_time)],'rapid_dose_result')


                       %% high antigen concentration with slow increase%%%  

                         tau_up_temp=1000;
                         slow_dose_result=importdata(['slow_dose_result_delay_',num2str(delayed_time),'.mat']);

                         %plot
                         fig3_plot_time_series_final_timedelay(slow_dose_result,p,tau_up_temp,delayed_time) 
% %                          save(['slow_dose_result_delay_',num2str(delayed_time)],'slow_dose_result')



                    %% input rapidness dependency (convergence value of intensity of response) (fig3c)

                        tic
                        antigen_satu=200;
                        t_end=1000000;%%%%%%%%変更の必要あり%%%%%%%%

                        tau_list=1:1:1500;%%%%%%%%変更の必要あり%%%%%%%%


                       tau_result_satu=importdata(['tau_result_satu_delay_',num2str(delayed_time),'.mat']);

                        %plot
                        plot_input_dynamics_final_timedelay(tau_list,tau_result_satu,delayed_time)
% %                         save(['tau_result_satu_delay_',num2str(delayed_time)],'tau_result_satu')
% % 

                        toc


                        %% dependency of steady state response on antigen concentration and input rapidness (fig3d)

                        antigen_satu_list=0:1:500;%%%%%%%%変更の必要あり%%%%%%%%
                        tau_list=1:1:1000;%%%%%%%%変更の必要あり%%%%%%%%
                        func_num=1;
                        


            heatmap_result_Th=importdata(['heatmap_result_Th_delay_',num2str(delayed_time),'.mat']);
            heatmap_result_Tr=importdata(['heatmap_result_Tr_delay_',num2str(delayed_time),'.mat']);
            heatmap_result_R=importdata(['heatmap_result_R_delay_',num2str(delayed_time),'.mat']);
            heatmap_result_Mh=importdata(['heatmap_result_Mh_delay_',num2str(delayed_time),'.mat']);
            heatmap_result_Mr=importdata(['heatmap_result_Mr_delay_',num2str(delayed_time),'.mat']);
            
            
                        %plot
            fig3_plot_heatmap(heatmap_result_Th,heatmap_result_Tr,heatmap_result_R,heatmap_result_Mh,heatmap_result_Mr)


            
toc