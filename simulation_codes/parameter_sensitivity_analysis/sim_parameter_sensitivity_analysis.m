%%% parameter sensitivity analysis %%%

    clear

    p=get_para_final;

    dt=0.01;
    func_num=1;%linear dose response
    tau_up=100;%common rapidness of antigen input
    
%% parameter checked in sensitivity alanlysis(notations are changed into those in paper)

% % dc=p.dh;dr=p.dr;kc=p.knh;kr=p.knr;wc=p.kmh;wr=p.knr;
% % Tnaive=p.Tn;r0=p.rk;rs=p.ak;ra=p.br;Dc=p.Dh;Dr=p.Dr;sc=p.Bh;sr=p.Br;
% % ec=p.eh;er=p.er;mr=p.mr;Amax=p.beta;
% % mc=p.mh;K=p.K2;       

checked_parameter_list=["dh","dr","knh","knr","kmh","knr","Tn","rk","ak","br","Dh","Dr","Bh","Br","eh","er","mr","beta","mh","K2"];
% % checked_parameter_list=["dh","dr"];
num_of_checked_parameter=length(checked_parameter_list);

check_ratio=[1/5,1/2,1,2,5];
%check_ratio=[1/2,1,2];

        %% antigen concenetration dependency (convergence value of intensity of response) (fig2D) 
        tic

            t_end=1000000;%%%%%変更の必要あり%%%%%
            Antigen_list=0:1:500;%%%%%変更の必要あり%%%%%

            q=10;%calculation shrink setting
            
            
            sensitivity_result=zeros(num_of_checked_parameter,length(check_ratio),7,length(Antigen_list));
            
            
            for i=1:num_of_checked_parameter
                
                for l=1:length(check_ratio)
                    check_ind=[i,check_ratio(l)];
                    
                    if (i==1)&&(l==5) %the condition of dh=dh*5
                        dt_temp=dt/10;
                    else
                        dt_temp=dt;
                    end
                    
                    antigen_dependency_result=run_conc_dep_shrink_final_sensitivity_analysis(p,dt_temp,t_end,q,Antigen_list,tau_up,p.K2,func_num,checked_parameter_list,check_ind);
                    
                    %%fig2_plot_conc_dep_final_sensitivity_analysis(p,Antigen_list,antigen_dependency_result,func_num,checked_parameter_list,check_ind)
                    
                    sensitivity_result(i,l,:,:)=antigen_dependency_result;
                
                end
                
            end
            
            toc
            
 
nt=datetime('now');
DateString=datestr(nt,'yyyymmddHHMM');

save(['sensitivity_result_',num2str(DateString)],'sensitivity_result')
           
            

% % %% save dataをplot
% % 
% % sensitivity_result=importdata('sensitivity_result_202208081538.mat');


%% change notations into those in paper

% % dc=p.dh;dr=p.dr;kc=p.knh;kr=p.knr;wc=p.kmh;wr=p.knr;
% % Tnaive=p.Tn;r0=p.rk;rs=p.ak;ra=p.br;Dc=p.Dh;Dr=p.Dr;sc=p.Bh;sr=p.Br;
% % ec=p.eh;er=p.er;mr=p.mr;Amax=p.beta;
% % mc=p.mh;K=p.K2;       

checked_parameter_list=["dc","dr","kc","kr","wc","wr","Tn","r0","rs","ra","Dc","Dr","sc","sr","ec","er","mr","Amax","mc","K"];




%% plot (intensity)

            
fig_row=length(checked_parameter_list);
fig_line=length(check_ratio);




fig_num=fix(num_of_checked_parameter/4);% total number of figures (4 parameters in each figure)

if fig_num>4*num_of_checked_parameter
    fig_num=fig_num+1;
end
    

for fig=1:fig_num
    
 figure
 
    for l=1:length(check_ratio)

        for i=(4*fig-3):4*fig  %index of parameter
            
            
            %index of checked parameter=i
            %index of checked ratio=l
            
            
            
            if rem(i,4)==0
                row_ind=4;
            else
                row_ind=rem(i,4);
            end
            
            
            
          
            subplot(fig_line,4,4*l-(4-row_ind))

            check_ind=[i,check_ratio(l)];
            R_result=zeros(1,length(Antigen_list));

            for n=1:length(Antigen_list)
                R_result(n)=sensitivity_result(i,l,5,n);%intensity
            end

            plot(Antigen_list,R_result,'LineWidth',5,'Color','m')
            xlim([0,max(Antigen_list)])

            title([convertContainedStringsToChars(checked_parameter_list(check_ind(1))),'*',num2str(check_ind(2))])
            

        end


    end
    
    
end


sgtitle('intensity')

%%

%%% plot diagram of predictive coding %%% 
mc_ind=find(checked_parameter_list=="mc");
K_ind=find(checked_parameter_list=="K");
A_max_ind=find(checked_parameter_list=="Amax");

figure

Th_list=0:1:250;
mc=p.mh;K=p.K2;Amax=p.beta;

for l=1:length(check_ratio)
    
    for i=[mc_ind,K_ind]
    
      mc_temp=p.mh*check_ratio(l);
      K_temp=p.K2*check_ratio(l);
      Amax_temp=p.beta*check_ratio(l);
      
      subplot(length(check_ratio),3,3*l-2)
      %mc_temp,K,Amaxのplot
      f1_Th=mc_temp*Th_list;
      f2_Th=Amax*(Th_list./(Th_list+K));
      hold on
      plot(Th_list,f1_Th,'LineWidth',5,'Color',[1.0000,0.4118,0.1608])
      plot(Th_list,f2_Th,'LineWidth',5,'Color',[0.0471,0.5098,0.0157])
      title(['mc*',num2str(check_ratio(l))])
      
      
      subplot(length(check_ratio),3,3*l-1)
      %mc,K_temp,Amaxのplot
      f1_Th=mc*Th_list;
      f2_Th=Amax*(Th_list./(Th_list+K_temp));
      hold on
      plot(Th_list,f1_Th,'LineWidth',5,'Color',[1.0000,0.4118,0.1608])
      plot(Th_list,f2_Th,'LineWidth',5,'Color',[0.0471,0.5098,0.0157])
      title(['K*',num2str(check_ratio(l))])
      
      
      subplot(length(check_ratio),3,3*l)
      %mc,K,Amax_tempのplot
      f1_Th=mc*Th_list;
      f2_Th=Amax_temp*(Th_list./(Th_list+K));
      hold on
      plot(Th_list,f1_Th,'LineWidth',5,'Color',[1.0000,0.4118,0.1608])
      plot(Th_list,f2_Th,'LineWidth',5,'Color',[0.0471,0.5098,0.0157])
      title(['Anax*',num2str(check_ratio(l))])
      
      
      
    
    end
end



% % %% plot of population of T cells, memory T cells, and prediction error
% % 
% % for fig=1:fig_num
% %     
% %  figure
% %  
% %     for l=1:length(check_ratio)
% % 
% %         for i=(4*fig-3):4*fig  %index of parameter
% %             
% %             
% %             %index of checked parameter=i
% %             %index of checked ratio=l
% % 
% %             if rem(i,4)==0
% %                 row_ind=4;
% %             else
% %                 row_ind=rem(i,4);
% %             end
% %    
% %             subplot(fig_line,4,4*l-(4-row_ind))
% % 
% %             check_ind=[i,check_ratio(l)];
% %             Th_result=zeros(1,length(Antigen_list));
% % 
% %             for n=1:length(Antigen_list)
% %                 Th_result(n)=sensitivity_result(i,l,1,n);%intensity
% %             end
% % 
% %             plot(Antigen_list,Th_result,'LineWidth',5,'Color',[1.0000,0.4118,0.1608])
% %             xlim([0,max(Antigen_list)])
% % 
% %             title([convertContainedStringsToChars(checked_parameter_list(check_ind(1))),'*',num2str(check_ind(2))])
% %             
% % 
% %         end
% % 
% % 
% %     end
% %     
% %     
% % end
% % 
% % 
% % sgtitle('Th')
% % 
% % 
% % 
% % for fig=1:fig_num
% %     
% %  figure
% %  
% %     for l=1:length(check_ratio)
% % 
% %         for i=(4*fig-3):4*fig  %index of parameter
% %                        
% %             %index of checked parameter=i
% %             %index of checked ratio=l
% %             if rem(i,4)==0
% %                 row_ind=4;
% %             else
% %                 row_ind=rem(i,4);
% %             end
% %   
% %             subplot(fig_line,4,4*l-(4-row_ind))
% % 
% %             check_ind=[i,check_ratio(l)];
% %             Tr_result=zeros(1,length(Antigen_list));
% % 
% %             for n=1:length(Antigen_list)
% %                 Tr_result(n)=sensitivity_result(i,l,2,n);%intensity
% %             end
% % 
% %             plot(Antigen_list,Tr_result,'LineWidth',5,'Color',[0.0471,0.5098,0.0157])
% %             xlim([0,max(Antigen_list)])
% % 
% %             title([convertContainedStringsToChars(checked_parameter_list(check_ind(1))),'*',num2str(check_ind(2))])
% %             
% % 
% %         end
% % 
% % 
% %     end
% %     
% %     
% % end
% % 
% % 
% % sgtitle('Tr')
% % 
% % 
% % for fig=1:fig_num
% %     
% %  figure
% %  
% %     for l=1:length(check_ratio)
% % 
% %         for i=(4*fig-3):4*fig  %index of parameter
% %                        
% %             %index of checked parameter=i
% %             %index of checked ratio=l
% %             if rem(i,4)==0
% %                 row_ind=4;
% %             else
% %                 row_ind=rem(i,4);
% %             end
% %   
% %             subplot(fig_line,4,4*l-(4-row_ind))
% % 
% %             check_ind=[i,check_ratio(l)];
% %             mTh_result=zeros(1,length(Antigen_list));
% % 
% %             for n=1:length(Antigen_list)
% %                 mTh_result(n)=sensitivity_result(i,l,3,n);%intensity
% %             end
% % 
% %             plot(Antigen_list,mTh_result,'LineWidth',5,'Color',[1.0000,0.4118,0.1608])
% %             xlim([0,max(Antigen_list)])
% % 
% %             title([convertContainedStringsToChars(checked_parameter_list(check_ind(1))),'*',num2str(check_ind(2))])
% %             
% % 
% %         end
% % 
% % 
% %     end
% %     
% %     
% % end
% % 
% % 
% % sgtitle('mTh')
% % 
% % 
% % for fig=1:fig_num
% %     
% %  figure
% %  
% %     for l=1:length(check_ratio)
% % 
% %         for i=(4*fig-3):4*fig  %index of parameter
% %                        
% %             %index of checked parameter=i
% %             %index of checked ratio=l
% %             if rem(i,4)==0
% %                 row_ind=4;
% %             else
% %                 row_ind=rem(i,4);
% %             end
% %   
% %             subplot(fig_line,4,4*l-(4-row_ind))
% % 
% %             check_ind=[i,check_ratio(l)];
% %             mTr_result=zeros(1,length(Antigen_list));
% % 
% %             for n=1:length(Antigen_list)
% %                 mTr_result(n)=sensitivity_result(i,l,4,n);%intensity
% %             end
% % 
% %             plot(Antigen_list,mTr_result,'LineWidth',5,'Color',[0.0471,0.5098,0.0157])
% %             xlim([0,max(Antigen_list)])
% % 
% %             title([convertContainedStringsToChars(checked_parameter_list(check_ind(1))),'*',num2str(check_ind(2))])
% %             
% % 
% %         end
% % 
% % 
% %     end
% %     
% %     
% % end
% % 
% % 
% % sgtitle('mTr')
% % 
% % 
% % 
% % for fig=1:fig_num
% %     
% %  figure
% %  
% %     for l=1:length(check_ratio)
% % 
% %         for i=(4*fig-3):4*fig  %index of parameter
% %                        
% %             %index of checked parameter=i
% %             %index of checked ratio=l
% %             if rem(i,4)==0
% %                 row_ind=4;
% %             else
% %                 row_ind=rem(i,4);
% %             end
% %   
% %             subplot(fig_line,4,4*l-(4-row_ind))
% % 
% %             check_ind=[i,check_ratio(l)];
% %             Mh_result=zeros(1,length(Antigen_list));
% % 
% %             for n=1:length(Antigen_list)
% %                 Mh_result(n)=sensitivity_result(i,l,6,n);%intensity
% %             end
% % 
% %             scatter(Antigen_list,Mh_result>10^(-5))
% %             xlim([0,max(Antigen_list)])
% % 
% %             title([convertContainedStringsToChars(checked_parameter_list(check_ind(1))),'*',num2str(check_ind(2))])
% %             
% % 
% %         end
% % 
% % 
% %     end
% %     
% %     
% % end
% % 
% % 
% % sgtitle('Mh>0.00001')
% % 
% % 
% % 
% % for fig=1:fig_num
% %     
% %  figure
% %  
% %     for l=1:length(check_ratio)
% % 
% %         for i=(4*fig-3):4*fig  %index of parameter
% %                        
% %             %index of checked parameter=i
% %             %index of checked ratio=l
% %             if rem(i,4)==0
% %                 row_ind=4;
% %             else
% %                 row_ind=rem(i,4);
% %             end
% %   
% %             subplot(fig_line,4,4*l-(4-row_ind))
% % 
% %             check_ind=[i,check_ratio(l)];
% %             Mr_result=zeros(1,length(Antigen_list));
% % 
% %             for n=1:length(Antigen_list)
% %                 Mr_result(n)=sensitivity_result(i,l,7,n);%intensity
% %             end
% % 
% %             scatter(Antigen_list,Mr_result>10^(-5))
% %             xlim([0,max(Antigen_list)])
% % 
% %             title([convertContainedStringsToChars(checked_parameter_list(check_ind(1))),'*',num2str(check_ind(2))])
% %             
% % 
% %         end
% % 
% % 
% %     end
% %     
% %     
% % end
% % 
% % 
% % sgtitle('Mr>0.00001')