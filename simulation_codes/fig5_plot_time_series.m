function fig=fig5_plot_time_series(history_result_linear_former,history_result_linear_latter,...
                                   history_result_sig_former,history_result_sig_latter,...
                                   history_result_step_former,history_result_step_latter)

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
   
   
   
   nt=datetime('now');
   DateString=datestr(nt,'yyyymmddHHMM');
   
  
   
   figure
   subplot(6,3,[1,2])
   plot(T_former_linear,R_former_linear,'Color','m','LineWidth',5)
   xlim([min(T_former_linear),max(T_former_linear)])
   ax=gca;
   ax.FontSize=20;
   
   subplot(6,3,3)
   plot(T_latter_linear,R_latter_linear,'Color','m','LineWidth',5)
   xlim([min(T_latter_linear),max(T_latter_linear)])
   ylim([0,1])
   ax=gca;
   ax.FontSize=20;
   
   subplot(6,3,[13,14,16,17])
   hold on
   plot(T_former_linear,Th_former_linear,'LineWidth',5,'Color',[1.0000,0.4118,0.1608])
   plot(T_former_linear,Tr_former_linear,'LineWidth',5,'Color',[0.0471,0.5098,0.0157])
   xlim([min(T_former_linear),max(T_former_linear)])
   ylim([0,800])
   ax=gca;
   ax.FontSize=20;
   
   subplot(6,3,[15,18])
   hold on
   plot(T_latter_linear,Th_latter_linear,'LineWidth',5,'Color',[1.0000,0.4118,0.1608])
   plot(T_latter_linear,Tr_latter_linear,'LineWidth',5,'Color',[0.0471,0.5098,0.0157])
   xlim([min(T_latter_linear),max(T_latter_linear)])
   %ylim([0,2500])
   sgtitle('linear')
   ax=gca;
   ax.FontSize=20;
   
   
   
    f = gcf;
    set(gcf,'renderer','painters')
    f.WindowState = 'maximized';
% %     savefig(f,['fig6_dose_response_linear_',num2str(DateString),').fig'])
% %     saveas(f,['fig6_dose_response_linear_',num2str(DateString),').eps'],'epsc2')%最後に"epsc2"を付けないとモノクロで出力されてしまう
% % 
% %    
   
   
   figure
   subplot(6,3,[1,2])
   plot(T_former_sig,R_former_sig,'Color','m','LineWidth',5)
   xlim([min(T_former_sig),max(T_former_sig)])
   ax=gca;
   ax.FontSize=20;
   
   subplot(6,3,3)
   plot(T_latter_sig,R_latter_sig,'Color','m','LineWidth',5)
   xlim([min(T_latter_sig),max(T_latter_sig)])
   ylim([0,5])
   ax=gca;
   ax.FontSize=20;
   
   subplot(6,3,[13,14,16,17])
   hold on
   plot(T_former_sig,Th_former_sig,'LineWidth',5,'Color',[1.0000,0.4118,0.1608])
   plot(T_former_sig,Tr_former_sig,'LineWidth',5,'Color',[0.0471,0.5098,0.0157])
   xlim([min(T_former_sig),max(T_former_sig)])
   ylim([0,800])
   ax=gca;
   ax.FontSize=20;
   
   subplot(6,3,[15,18])
   hold on
   plot(T_latter_sig,Th_latter_sig,'LineWidth',5,'Color',[1.0000,0.4118,0.1608])
   plot(T_latter_sig,Tr_latter_sig,'LineWidth',5,'Color',[0.0471,0.5098,0.0157])
   xlim([min(T_latter_sig),max(T_latter_sig)])
   ylim([0,1000])
   sgtitle('sigmoid')
   ax=gca;
   ax.FontSize=20;
   
   f = gcf;
    set(gcf,'renderer','painters')
    f.WindowState = 'maximized';
% %     savefig(f,['fig6_dose_response_sig_',num2str(DateString),').fig'])
% %     saveas(f,['fig6_dose_response_sig_',num2str(DateString),').eps'],'epsc2')%最後に"epsc2"を付けないとモノクロで出力されてしまう

   
   
   figure
   subplot(6,3,[1,2])
   plot(T_former_step,R_former_step,'Color','m','LineWidth',5)
   xlim([min(T_former_step),max(T_former_step)])
   ax=gca;
   ax.FontSize=20;
   
   subplot(6,3,3)
   plot(T_latter_step,R_latter_step,'Color','m','LineWidth',5)
   xlim([min(T_latter_step),max(T_latter_step)])
   ylim([0,10])
   ax=gca;
   ax.FontSize=20;
   
   subplot(6,3,[13,14,16,17])
   hold on
   plot(T_former_step,Th_former_step,'LineWidth',5,'Color',[1.0000,0.4118,0.1608])
   plot(T_former_step,Tr_former_step,'LineWidth',5,'Color',[0.0471,0.5098,0.0157])
   xlim([min(T_former_step),max(T_former_step)])
   ylim([0,800])
   ax=gca;
   ax.FontSize=20;
   
   subplot(6,3,[15,18])
   hold on
   plot(T_latter_step,Th_latter_step,'LineWidth',5,'Color',[1.0000,0.4118,0.1608])
   plot(T_latter_step,Tr_latter_step,'LineWidth',5,'Color',[0.0471,0.5098,0.0157])
   xlim([min(T_latter_step),max(T_latter_step)])
   ylim([0,1000])
   sgtitle('step')
   ax=gca;
   ax.FontSize=20;
   
   f = gcf;
    set(gcf,'renderer','painters')
    f.WindowState = 'maximized';
% %     savefig(f,['fig6_dose_response_step_',num2str(DateString),').fig'])
% %     saveas(f,['fig6_dose_response_step_',num2str(DateString),').eps'],'epsc2')%最後に"epsc2"を付けないとモノクロで出力されてしまう


   
   figure
   subplot(6,3,[1,2])
   plot(T_former_linear,Antigen_former_linear,'Color',[0.5020 0.5020 0.5020],'LineWidth',5)
   xlim([min(T_former_linear),max(T_former_linear)])
   %ylim([0,1000])
   ax=gca;
   ax.FontSize=20;
   
   subplot(6,3,3)
   plot(T_latter_linear,Antigen_latter_linear,'Color',[0.5020 0.5020 0.5020],'LineWidth',5)
   xlim([min(T_latter_linear),max(T_latter_linear)])
   ax=gca;
   ax.FontSize=20;
   
   f = gcf;
    set(gcf,'renderer','painters')
    f.WindowState = 'maximized';
% %     savefig(f,['fig6_dose_response_antigen_input_',num2str(DateString),').fig'])
% %     saveas(f,['fig6_dose_response_antigen_input_',num2str(DateString),').eps'],'epsc2')%最後に"epsc2"を付けないとモノクロで出力されてしまう




end
