function plot_fig=fig2_plot_conc_dep_final_sensitivity_analysis(p,A,conc_dep_result,func_num,checked_parameter_list,check_ind)

Th_satu=conc_dep_result(1,:);
Tr_satu=conc_dep_result(2,:);
mTh_satu=conc_dep_result(3,:);
mTr_satu=conc_dep_result(4,:);
R_satu=conc_dep_result(5,:);



% % % checked_parameter_list=["dh","dr","knh","knr","kmh","knr","Tn","rk","ak","br","Dh","Dr","Bh","Br","eh","er","mr","beta","mh","K2"];
% % checked_parameter_list=["dh"];
% % num_of_checked_parameter=length(checked_parameter_list);
% % 
% % %check_ratio=[1/5,1/2,1,2,5];
% % check_ratio=[1/2,1];
% % check_ind=[i,check_ratio(l)];





figure
subplot(4,2,1)
plot(A,Th_satu,'LineWidth',5,'Color',[1.0000,0.4118,0.1608])
title('Th(inf)')
xlabel('antigen')

subplot(4,2,2)
plot(A,Tr_satu,'LineWidth',5,'Color',[0.0471,0.5098,0.0157])
title('Tr(inf)')
xlabel('antigen')

subplot(4,2,3)
plot(A,mTh_satu,'LineWidth',5,'Color',[1.0000,0.4118,0.1608])
title('mTh(inf)')
xlabel('antigen')

subplot(4,2,4)
plot(A,mTr_satu,'LineWidth',5,'Color',[0.0471,0.5098,0.0157])
title('mTr(inf)')
xlabel('antigen')

subplot(4,2,5)
plot(A,R_satu,'LineWidth',5,'Color','m')
title('R(inf)')
xlabel('antigen')



f1_Th=p.mh*Th_satu;
f2_Th=p.beta*(Th_satu./(Th_satu+p.K2));

Mh=p.eh*max(0,A-f1_Th);
Mr=p.er*max(0,f2_Th-A-p.mr*Tr_satu);

subplot(4,2,7)
scatter(A,Mh>10^(-5))
title('Mh>0.00001')

subplot(4,2,8)
scatter(A,Mr>10^(-5))
title('Mr>0.00001')

sgtitle([convertContainedStringsToChars(checked_parameter_list(check_ind(1))),'*',num2str(check_ind(2))])




figure
subplot(3,3,[1,2,4,5])
plot(A,R_satu,'LineWidth',5,'Color','m')
xlim([0,max(A)])
title('R(inf)')
%保存
ax=gca;
ax.FontSize=20;
f = gcf;
set(gcf,'renderer','painters')
f.WindowState = 'maximized';
nt=datetime('now');
DateString=datestr(nt,'yyyymmddHHMM');
% % savefig(f,['fig2_antigen_conc_dep_',num2str(DateString),'.fig'])
% % saveas(f,['fig2_antigen_conc_dep_',num2str(DateString),'.eps'],'epsc2')
% % 
sgtitle([convertContainedStringsToChars(checked_parameter_list(check_ind(1))),'*',num2str(check_ind(2))])





end