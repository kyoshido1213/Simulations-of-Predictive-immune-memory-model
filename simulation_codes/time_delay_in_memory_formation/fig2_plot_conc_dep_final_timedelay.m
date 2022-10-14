function plot_fig=fig2_plot_conc_dep_final_timedelay(p,A,conc_dep_result,func_num,delayed_time)

%antigen_dependency_result=[Th_satu;Tr_satu;mTh_satu;mTr_satu;R_satu;Mh_satu;Mr_satu];
Th_satu=conc_dep_result(1,:);
Tr_satu=conc_dep_result(2,:);
mTh_satu=conc_dep_result(3,:);
mTr_satu=conc_dep_result(4,:);
R_satu=conc_dep_result(5,:);




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

sgtitle(['delay=',num2str(delayed_time)])



figure
subplot(3,3,[1,2,4,5])
plot(A,R_satu,'LineWidth',5,'Color','m')
xlim([0,max(A)])
title('R(inf)')

sgtitle(['delay=',num2str(delayed_time)])



end