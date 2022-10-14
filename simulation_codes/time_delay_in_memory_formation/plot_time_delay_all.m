clear

p=get_para_final;
func_num=1;

delay_time_list=[0,10,50];

for i=1:3
    
    delayed_time=delay_time_list(i);
    
    high_dose_result=importdata(['high_dose_result_delay_',num2str(delayed_time),'.mat']);
    low_dose_result=importdata(['low_dose_result_delay_',num2str(delayed_time),'.mat']);
    
    antigen_satu=200;
    fig2_plot_time_series_final_timedelay(high_dose_result,p,antigen_satu,delayed_time)
    
    antigen_satu=20;
    fig2_plot_time_series_final_timedelay(low_dose_result,p,antigen_satu,delayed_time)
    
    
    
    Antigen_list=0:1:500;
    antigen_dependency_result=importdata(['antigen_dependency_result_delay_',num2str(delayed_time),'.mat']);
    fig2_plot_conc_dep_final_timedelay(p,Antigen_list,antigen_dependency_result,func_num,delayed_time)


    
end
