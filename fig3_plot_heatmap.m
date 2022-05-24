function fig=fig3_plot_heatmap(heatmap_result_Th,heatmap_result_Tr,heatmap_result_R,heatmap_result_Mh,heatmap_result_Mr)


        figure
        subplot(2,2,1)
        imagesc(heatmap_result_Th)
        ylabel('tau')
        xlabel('antigen')
        title('Th(inf)')
        axis xy
        ax=gca;
        ax.FontSize=20;

        subplot(2,2,2)
        imagesc(heatmap_result_Tr)
        ylabel('tau')
        xlabel('antigen')
        title('Tr(inf)')
        axis xy
        ax=gca;
        ax.FontSize=20;

        subplot(2,2,3)
        imagesc(heatmap_result_R)
        ylabel('tau')
        xlabel('antigen')
        title('R(inf)')
        axis xy
        ax=gca;
        ax.FontSize=20;

        %保存
        f = gcf;
        set(gcf,'renderer','painters')
        f.WindowState = 'maximized';
% %         savefig(f,['fig4_heatmap(tau_antigen)_',num2str(DateString),'.fig'])
% %         saveas(f,['fig4_heatmap(tau_antigen)_',num2str(DateString),'.eps'],'epsc2')



        figure
        subplot(1,2,1)
        imagesc(heatmap_result_Mh>10^(-5))
        ylabel('tau')
        xlabel('antigen')
        title('Mh(inf)>0.00001')
        axis xy

        subplot(1,2,2)
        imagesc(heatmap_result_Mr>10^(-5))
        ylabel('tau')
        xlabel('antigen')
        title('Mr(inf)>0.00001')
        axis xy

        

end