function fig=fig2_plot_time_series_final_timedelay(result_data,p,antigen_satu,delayed_time)

T=result_data(1,:);Th=result_data(2,:);Tr=result_data(3,:);mTh=result_data(4,:);mTr=result_data(5,:);
Th_naive=result_data(6,:);Tr_naive=result_data(7,:);Th_memory=result_data(8,:);Tr_memory=result_data(9,:);
Mh_list=result_data(10,:);Mr_list=result_data(11,:);Antigen_result=result_data(12,:);R=result_data(13,:);


figure
subplot(3,2,1)
plot(T,Antigen_result,'Color',[0.5020 0.5020 0.5020],'LineWidth',5)
ylim([0,210])
xlabel('time')
xlim([0,max(T)])
title('Antigen')
ax=gca;
ax.FontSize=20;

subplot(3,2,3)
hold on
plot(T,Th,'LineWidth',5,'Color',[1.0000,0.4118,0.1608])
plot(T,Tr,'LineWidth',5,'Color',[0.0471,0.5098,0.0157])
xlabel('time')
ylim([0,100])
xlim([0,max(T)])
legend('Th','Tr')
title('Th and Tr')
ax=gca;
ax.FontSize=20;

subplot(3,2,4)
hold on
plot(T,mTh,'LineWidth',5,'Color',[1.0000,0.4118,0.1608])
plot(T,mTr,'LineWidth',5,'Color',[0.0471,0.5098,0.0157])
xlabel('time')
xlim([0,max(T)])
%ylim([0,100])
legend('mTh','mTr')
title('mTh and mTr')
ax=gca;
ax.FontSize=20;

subplot(3,2,5)
hold on
plot(T,Mh_list,'LineWidth',5,'Color',[1.0000,0.4118,0.1608])
plot(T,Mr_list,'LineWidth',5,'Color',[0.0471,0.5098,0.0157])
xlabel('time')
ylim([0,0.015])
xlim([0,max(T)])
legend('Mh','Mr')
title('Mh and Mr')
ax=gca;
ax.FontSize=20;


subplot(3,2,6)
plot(T,R,'Color','m','LineWidth',5)
xlim([0,max(T)])
xlabel('time')

% % if antigen_satu==200
% %     ylim([0,200])
% % elseif antigen_satu==20
% %     ylim([0,10])
% % end

if antigen_satu==20
    ylim([0,10])
end


ax=gca;
ax.FontSize=20;


f = gcf;
set(gcf,'renderer','painters')
f.WindowState = 'maximized';

sgtitle(['delay=',num2str(delayed_time)])

end

