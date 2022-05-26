function fig=fig2_heatmap_plot_final(heatmap_result_Th,heatmap_result_Tr,heatmap_result_R,heatmap_result_Mh,heatmap_result_Mr)


        figure
        imagesc(heatmap_result_Th)
        xlabel('antigen')
        ylabel('K2')
        axis xy
        title('Th(inf)')
        ax=gca;
        ax.FontSize=30;
        %保存
        f = gcf;
        set(gcf,'renderer','painters')
        f.WindowState = 'maximized';
        % savefig(f,['fig3_heatmap_Th_',num2str(DateString),'.fig'])
        % saveas(f,['fig3_heatmap_Th_',num2str(DateString),'.eps'],'epsc2')


        figure
        imagesc(heatmap_result_Tr)
        xlabel('antigen')
        ylabel('K2')
        axis xy
        title('Tr(inf)')
        ax=gca;
        ax.FontSize=30;
        %保存
        f = gcf;
        set(gcf,'renderer','painters')
        f.WindowState = 'maximized';
        % savefig(f,['fig3_heatmap_Tr_',num2str(DateString),'.fig'])
        % saveas(f,['fig3_heatmap_Tr_',num2str(DateString),'.eps'],'epsc2')


        figure
        imagesc(heatmap_result_R)
        xlabel('antigen')
        ylabel('K2')
        axis xy
        title('R(inf)')
        ax=gca;
        ax.FontSize=30;
        %保存
        f = gcf;
        set(gcf,'renderer','painters')
        f.WindowState = 'maximized';
        % savefig(f,['fig3_heatmap_intensity_',num2str(DateString),'.fig'])
        % saveas(f,['fig3_heatmap_intensity_',num2str(DateString),'.eps'],'epsc2')
        
        
        figure
        subplot(1,2,1)
        imagesc(heatmap_result_Mh>0.00001)
        xlabel('antigen')
        ylabel('K2')
        axis xy
        title('Mh>0.00001')
        
        subplot(1,2,2)
        imagesc(heatmap_result_Mr>0.00001)
        xlabel('antigen')
        ylabel('K2')
        axis xy
        title('Mr>0.00001')
        
        
end

