function fig=S_fig1_plot_dose_response_each_fig_final(history_result_linear_former,history_result_linear_latter,history_result_sig_former,history_result_sig_latter,history_result_step_former,history_result_step_latter,func_num_mTr)

%run_result=[T;Th;Tr;mTh;mTr;Th_naive;Tr_naive;Th_memory;Tr_memory;Mh_list;Mr_list;Antigen;R];

%linear
  %TとAntigen
   T_former_linear=history_result_linear_former(1,:);
   T_latter_linear=history_result_linear_latter(1,:);
   Antigen_former_linear=history_result_linear_former(12,:);
   Antigen_latter_linear=history_result_linear_latter(12,:);

  %ThとTr
   Th_former_linear=history_result_linear_former(2,:);
   Th_latter_linear=history_result_linear_latter(2,:);
   Tr_former_linear=history_result_linear_former(3,:);
   Tr_latter_linear=history_result_linear_latter(3,:);
  
  %intensity
   R_former_linear=history_result_linear_former(13,:);
   R_latter_linear=history_result_linear_latter(13,:);
   
   
   %mThとmTr
   mTh_former_linear=history_result_linear_former(4,:);
   mTh_latter_linear=history_result_linear_latter(4,:);
   mTr_former_linear=history_result_linear_former(5,:);
   mTr_latter_linear=history_result_linear_latter(5,:);
   
   %MhとMr
   Mh_former_linear=history_result_linear_former(10,:);
   Mh_latter_linear=history_result_linear_latter(10,:);
   Mr_former_linear=history_result_linear_former(11,:);
   Mr_latter_linear=history_result_linear_latter(11,:);


%sigmoid
   %TとAntigen
   T_former_sig=history_result_sig_former(1,:);
   T_latter_sig=history_result_sig_latter(1,:);
   Antigen_former_sig=history_result_sig_former(12,:);
   Antigen_latter_sig=history_result_sig_latter(12,:);

  %ThとTr
   Th_former_sig=history_result_sig_former(2,:);
   Th_latter_sig=history_result_sig_latter(2,:);
   Tr_former_sig=history_result_sig_former(3,:);
   Tr_latter_sig=history_result_sig_latter(3,:);
  
  %intensity
   R_former_sig=history_result_sig_former(13,:);
   R_latter_sig=history_result_sig_latter(13,:);
   
   
   %mThとmTr
   mTh_former_sig=history_result_sig_former(4,:);
   mTh_latter_sig=history_result_sig_latter(4,:);
   mTr_former_sig=history_result_sig_former(5,:);
   mTr_latter_sig=history_result_sig_latter(5,:);
   
   %MhとMr
   Mh_former_sig=history_result_sig_former(10,:);
   Mh_latter_sig=history_result_sig_latter(10,:);
   Mr_former_sig=history_result_sig_former(11,:);
   Mr_latter_sig=history_result_sig_latter(11,:);


%step
  %TとAntigen
   T_former_step=history_result_step_former(1,:);
   T_latter_step=history_result_step_latter(1,:);
   Antigen_former_step=history_result_step_former(12,:);
   Antigen_latter_step=history_result_step_latter(12,:);

  %ThとTr
   Th_former_step=history_result_step_former(2,:);
   Th_latter_step=history_result_step_latter(2,:);
   Tr_former_step=history_result_step_former(3,:);
   Tr_latter_step=history_result_step_latter(3,:);
  
  %intensity
   R_former_step=history_result_step_former(13,:);
   R_latter_step=history_result_step_latter(13,:);
   
   
   %mThとmTr
   mTh_former_step=history_result_step_former(4,:);
   mTh_latter_step=history_result_step_latter(4,:);
   mTr_former_step=history_result_step_former(5,:);
   mTr_latter_step=history_result_step_latter(5,:);
   
   %MhとMr
   Mh_former_step=history_result_step_former(10,:);
   Mh_latter_step=history_result_step_latter(10,:);
   Mr_former_step=history_result_step_former(11,:);
   Mr_latter_step=history_result_step_latter(11,:);
   
   
   
   nt=datetime('now');
   DateString=datestr(nt,'yyyymmddHHMM');
   
   
   
   
   figure
   %%%linear%%%
   %intensity
   max_list=[R_former_linear,R_latter_linear];
   
   subplot(3,16,[13,14])
   plot(T_former_linear,R_former_linear,'Color','m','LineWidth',3)
   xlim([min(T_former_linear),max(T_former_linear)])
   %ylim([0,max(max_list)])
   ylim([0,200])
   
   
   subplot(3,16,15)
   plot(T_latter_linear,R_latter_linear,'Color','m','LineWidth',3)
   xlim([min(T_latter_linear),max(T_latter_linear)])
   ylim([0,11])
   
   
   
   
   
   %Th and Tr
   max_list=[Th_former_linear,Tr_former_linear,Th_latter_linear,Tr_latter_linear];
   
   subplot(3,16,[1,2])
   hold on
   plot(T_former_linear,Th_former_linear,'LineWidth',3,'Color',[1.0000,0.4118,0.1608])
   plot(T_former_linear,Tr_former_linear,'LineWidth',3,'Color',[0.0471,0.5098,0.0157])
   xlim([min(T_former_linear),max(T_former_linear)])
   ylim([0,900])
   ylabel('Th dose-response:linear')
  
   
   subplot(3,16,3)
   hold on
   plot(T_latter_linear,Th_latter_linear,'LineWidth',3,'Color',[1.0000,0.4118,0.1608])
   plot(T_latter_linear,Tr_latter_linear,'LineWidth',3,'Color',[0.0471,0.5098,0.0157])
   xlim([min(T_latter_linear),max(T_latter_linear)])
   ylim([0,900])
   %ylim([0,max(max_list)])
   
   
   %mTh and mTr
   max_list=[mTh_former_linear,mTr_former_linear,mTh_latter_linear,mTr_latter_linear];
   
   subplot(3,16,[5,6])
   hold on
   plot(T_former_linear,mTh_former_linear,'LineWidth',3,'Color',[1.0000,0.4118,0.1608])
   plot(T_former_linear,mTr_former_linear,'LineWidth',3,'Color',[0.0471,0.5098,0.0157])
   xlim([min(T_former_linear),max(T_former_linear)])
   ylim([0,1200])
   %ylim([0,max(max_list)])
   
   subplot(3,16,7)
   hold on
   plot(T_latter_linear,mTh_latter_linear,'LineWidth',3,'Color',[1.0000,0.4118,0.1608])
   plot(T_latter_linear,mTr_latter_linear,'LineWidth',3,'Color',[0.0471,0.5098,0.0157])
   xlim([min(T_latter_linear),max(T_latter_linear)])
   %ylim([0,max(max_list)])
   ylim([0,1200])
  
   
   %Mh and Mr
   max_list=[Mh_former_linear,Mr_former_linear,Mh_latter_linear,Mr_latter_linear];
   
   subplot(3,16,[9,10])
   hold on
   plot(T_former_linear,Mh_former_linear,'LineWidth',3,'Color',[1.0000,0.4118,0.1608])
   plot(T_former_linear,Mr_former_linear,'LineWidth',3,'Color',[0.0471,0.5098,0.0157])
   xlim([min(T_former_linear),max(T_former_linear)])
%    ylim([0,max(max_list)])
   ylim([0,0.06])
   
   
   subplot(3,16,11)
   hold on
   plot(T_latter_linear,Mh_latter_linear,'LineWidth',3,'Color',[1.0000,0.4118,0.1608])
   plot(T_latter_linear,Mr_latter_linear,'LineWidth',3,'Color',[0.0471,0.5098,0.0157])
   xlim([min(T_latter_linear),max(T_latter_linear)])
  %    ylim([0,max(max_list)])
   ylim([0,0.06])

   
   %%%sigmoid%%%
   %intensity
   max_list=[R_former_sig,R_latter_sig];
   
   subplot(3,16,[29,30])
   plot(T_former_sig,R_former_sig,'Color','m','LineWidth',3)
   xlim([min(T_former_sig),max(T_former_sig)])
   %ylim([0,max(max_list)])
   ylim([0,200])
   
   
   subplot(3,16,31)
   plot(T_latter_sig,R_latter_sig,'Color','m','LineWidth',3)
   xlim([min(T_latter_sig),max(T_latter_sig)])
   ylim([0,11])
   
   
   
   %Th and Tr
   max_list=[Th_former_sig,Tr_former_sig,Th_latter_sig,Tr_latter_sig];
   
   subplot(3,16,[17,18])
   hold on
   plot(T_former_sig,Th_former_sig,'LineWidth',3,'Color',[1.0000,0.4118,0.1608])
   plot(T_former_sig,Tr_former_sig,'LineWidth',3,'Color',[0.0471,0.5098,0.0157])
   xlim([min(T_former_sig),max(T_former_sig)])
   ylabel('Th dose-response:sigmoid')
   ylim([0,900])
  
   
   subplot(3,16,19)
   hold on
   plot(T_latter_sig,Th_latter_sig,'LineWidth',3,'Color',[1.0000,0.4118,0.1608])
   plot(T_latter_sig,Tr_latter_sig,'LineWidth',3,'Color',[0.0471,0.5098,0.0157])
   xlim([min(T_latter_sig),max(T_latter_sig)])
   ylim([0,900])
   %ylim([0,max(max_list)])
   
   
   %mTh and mTr
   max_list=[mTh_former_sig,mTr_former_sig,mTh_latter_sig,mTr_latter_sig];
   
   subplot(3,16,[21,22])
   hold on
   plot(T_former_sig,mTh_former_sig,'LineWidth',3,'Color',[1.0000,0.4118,0.1608])
   plot(T_former_sig,mTr_former_sig,'LineWidth',3,'Color',[0.0471,0.5098,0.0157])
   xlim([min(T_former_sig),max(T_former_sig)])
   %ylim([0,max(max_list)])
   ylim([0,2000])
   
   subplot(3,16,23)
   hold on
   plot(T_latter_sig,mTh_latter_sig,'LineWidth',3,'Color',[1.0000,0.4118,0.1608])
   plot(T_latter_sig,mTr_latter_sig,'LineWidth',3,'Color',[0.0471,0.5098,0.0157])
   xlim([min(T_latter_sig),max(T_latter_sig)])
   %ylim([0,max(max_list)])
   ylim([0,2000])
   
   %Mh and Mr
   max_list=[Mh_former_sig,Mr_former_sig,Mh_latter_sig,Mr_latter_sig];
   
   subplot(3,16,[25,26])
   hold on
   plot(T_former_sig,Mh_former_sig,'LineWidth',3,'Color',[1.0000,0.4118,0.1608])
   plot(T_former_sig,Mr_former_sig,'LineWidth',3,'Color',[0.0471,0.5098,0.0157])
   xlim([min(T_former_sig),max(T_former_sig)])
   %    ylim([0,max(max_list)])
   ylim([0,0.06])

   
   
   subplot(3,16,27)
   hold on
   plot(T_latter_sig,Mh_latter_sig,'LineWidth',3,'Color',[1.0000,0.4118,0.1608])
   plot(T_latter_sig,Mr_latter_sig,'LineWidth',3,'Color',[0.0471,0.5098,0.0157])
   xlim([min(T_latter_sig),max(T_latter_sig)])
   %    ylim([0,max(max_list)])
   ylim([0,0.06])

   
    
   
   %%%step%%%
   %intensity
   max_list=[R_former_step,R_latter_step];
   
   subplot(3,16,[45,46])
   plot(T_former_step,R_former_step,'Color','m','LineWidth',3)
   xlim([min(T_former_step),max(T_former_step)])
   %ylim([0,max(max_list)])
   ylim([0,200])
   
   subplot(3,16,47)
   plot(T_latter_step,R_latter_step,'Color','m','LineWidth',3)
   xlim([min(T_latter_step),max(T_latter_step)])
   ylim([0,11])
   
   
   
   %Th and Tr
   max_list=[Th_former_step,Tr_former_step,Th_latter_step,Tr_latter_step];
   
   subplot(3,16,[33,34])
   hold on
   plot(T_former_step,Th_former_step,'LineWidth',3,'Color',[1.0000,0.4118,0.1608])
   plot(T_former_step,Tr_former_step,'LineWidth',3,'Color',[0.0471,0.5098,0.0157])
   xlim([min(T_former_step),max(T_former_step)])
   ylim([0,900])
   ylabel('Th dose-response:step')
  
   
   subplot(3,16,35)
   hold on
   plot(T_latter_step,Th_latter_step,'LineWidth',3,'Color',[1.0000,0.4118,0.1608])
   plot(T_latter_step,Tr_latter_step,'LineWidth',3,'Color',[0.0471,0.5098,0.0157])
   xlim([min(T_latter_step),max(T_latter_step)])
   ylim([0,900])
   %ylim([0,max(max_list)])
   
   
   %mTh and mTr
   max_list=[mTh_former_step,mTr_former_step,mTh_latter_step,mTr_latter_step];
   
   subplot(3,16,[37,38])
   hold on
   plot(T_former_step,mTh_former_step,'LineWidth',3,'Color',[1.0000,0.4118,0.1608])
   plot(T_former_step,mTr_former_step,'LineWidth',3,'Color',[0.0471,0.5098,0.0157])
   xlim([min(T_former_step),max(T_former_step)])
   %ylim([0,max(max_list)])
   ylim([0,2000])
   
   subplot(3,16,39)
   hold on
   plot(T_latter_step,mTh_latter_step,'LineWidth',3,'Color',[1.0000,0.4118,0.1608])
   plot(T_latter_step,mTr_latter_step,'LineWidth',3,'Color',[0.0471,0.5098,0.0157])
   xlim([min(T_latter_step),max(T_latter_step)])
   %ylim([0,max(max_list)])
   ylim([0,2000])
   
   %Mh and Mr
   max_list=[Mh_former_step,Mr_former_step,Mh_latter_step,Mr_latter_step];
   
   subplot(3,16,[41,42])
   hold on
   plot(T_former_step,Mh_former_step,'LineWidth',3,'Color',[1.0000,0.4118,0.1608])
   plot(T_former_step,Mr_former_step,'LineWidth',3,'Color',[0.0471,0.5098,0.0157])
   xlim([min(T_former_step),max(T_former_step)])
   %    ylim([0,max(max_list)])
   ylim([0,0.06])

   
   
   subplot(3,16,43)
   hold on
   plot(T_latter_step,Mh_latter_step,'LineWidth',3,'Color',[1.0000,0.4118,0.1608])
   plot(T_latter_step,Mr_latter_step,'LineWidth',3,'Color',[0.0471,0.5098,0.0157])
   xlim([min(T_latter_step),max(T_latter_step)])
   %    ylim([0,max(max_list)])
   ylim([0,0.06])

   
   if func_num_mTr==1
       sgtitle('Tr dose-response:linear')
   elseif func_num_mTr==2
       sgtitle('Tr dose-response:sigmoid')
   elseif func_num_mTr==3
       sgtitle('Tr dose-response:step')
   end
   
   
   
   figure
   subplot(3,3,[1,2])
   plot(T_former_linear,Antigen_former_linear,'Color',[0.5020 0.5020 0.5020],'LineWidth',5)
   xlim([min(T_former_linear),max(T_former_linear)])
   %ylim([0,1000])
   ax=gca;
   ax.FontSize=20;
   
   subplot(3,3,3)
   plot(T_latter_linear,Antigen_latter_linear,'Color',[0.5020 0.5020 0.5020],'LineWidth',5)
   xlim([min(T_latter_linear),max(T_latter_linear)])
   %ylim([0,1000])
   ax=gca;
   ax.FontSize=20;
   
   
   sgtitle('Antigen input')
       
    
  
end
