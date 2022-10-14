function fig=plot_input_dynamics_final_timedelay(tau_list,tau_result_satu,delayed_time)

        Th_satu=tau_result_satu(1,:);
        Tr_satu=tau_result_satu(2,:);
        mTh_satu=tau_result_satu(3,:);
        mTr_satu=tau_result_satu(4,:);
        R_satu=tau_result_satu(5,:);
        Mh_satu=tau_result_satu(6,:);
        Mr_satu=tau_result_satu(7,:);

        figure
        subplot(4,2,1)
        plot(tau_list,Th_satu,'LineWidth',5,'Color',[1.0000,0.4118,0.1608])
        title('Th(inf)')
        %ylim([0,max(Th_satu)])
        xlabel('tau')

        subplot(4,2,2)
        plot(tau_list,Tr_satu,'LineWidth',5,'Color',[0.0471,0.5098,0.0157])
        %ylim([0,max(Tr_satu)])
        title('Tr(inf)')
        xlabel('tau')

        subplot(4,2,3)
        plot(tau_list,mTh_satu,'LineWidth',5,'Color',[1.0000,0.4118,0.1608])
        %ylim([0,max(mTh_satu)])
        title('mTh(inf)')
        xlabel('tau')

        subplot(4,2,4)
        plot(tau_list,mTr_satu,'LineWidth',5,'Color',[0.0471,0.5098,0.0157])
        %ylim([0,max(mTr_satu)])
        title('mTr(inf)')
        xlabel('tau')

        subplot(4,2,5)
        plot(tau_list,R_satu,'LineWidth',5,'Color','m')
        %ylim([0,max(R_satu)])
        title('R(inf)')
        xlabel('tau')


        subplot(4,2,7)
        scatter(tau_list,Mh_satu>10^(-5))
        title('Mh>0.00001')
        xlabel('tau')

        subplot(4,2,8)
        scatter(tau_list,Mr_satu>10^(-5))
        title('Mr>0.00001')
        xlabel('tau')
        
        sgtitle(['delay=',num2str(delayed_time)])



       

        figure
        subplot(2,2,1)
        plot(tau_list,R_satu,'LineWidth',5,'Color','m')
        %ylim([0,max(R_satu)])
        xlim([0,1500])
        title('R(inf)')
        xlabel('tau')
        
        
        sgtitle(['delay=',num2str(delayed_time)])
        
end

