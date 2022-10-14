function shrink_result=shrink_pre_final_sensitivity_analysis(p,dt,t_end,antigen_satu,tau_up,q,K2,func_num,checked_parameter_list,check_ind)


init_list=[p.Th0,p.Tr0,p.mTh0,p.mTr0,p.Th_naive0,p.Tr_naive0,p.Th_memory0,p.Tr_memory0,p.R0];


T_result=zeros(1,t_end/q+1);
Th_result=zeros(1,t_end/q+1);
Tr_result=zeros(1,t_end/q+1);
mTh_result=zeros(1,t_end/q+1);
mTr_result=zeros(1,t_end/q+1);
A_result=zeros(1,t_end/q+1);
R_result=zeros(1,t_end/q+1);

Mh_result=zeros(1,t_end/q+1);
Mr_result=zeros(1,t_end/q+1);

T_result(1)=0;
Th_result(1)=p.Th0;
Tr_result(1)=p.Tr0;
mTh_result(1)=p.mTh0;
mTr_result(1)=p.mTr0;
A_result(1)=0;
R_result(1)=0;



for ii=1:t_end/q
    
        TS=q*(ii-1);
        TE=q*ii;
%         pros1=[TS,TE];
%         disp(pros1)
    
        T_list_temp=TS:dt:TE;
        

        high_dose_result=run_time_series_shrink_final_sensitivity_analysis(p,dt,antigen_satu,tau_up,init_list,T_list_temp,K2,func_num,checked_parameter_list,check_ind);
        
        %run_result=[T;Th;Tr;mTh;mTr;Th_naive;Tr_naive;Th_memory;Tr_memory;Mh_list;Mr_list;Antigen;R];
            
            
            T=high_dose_result(1,1:(end-1));
            Th=high_dose_result(2,1:(end-1));
            Tr=high_dose_result(3,1:(end-1));
            mTh=high_dose_result(4,1:(end-1));
            mTr=high_dose_result(5,1:(end-1));
            A=high_dose_result(12,1:(end-1));
            R=high_dose_result(13,1:(end-1));

            Th_naive=high_dose_result(6,1:(end-1));
            Tr_naive=high_dose_result(7,1:(end-1));
            Th_memory=high_dose_result(8,1:(end-1));
            Tr_memory=high_dose_result(9,1:(end-1));
            
            Mh=high_dose_result(10,1:(end-1));
            Mr=high_dose_result(11,1:(end-1));
            
       


        T_result(ii+1)=T(end);
        Th_result(ii+1)=Th(end);
        Tr_result(ii+1)=Tr(end);
        mTh_result(ii+1)=mTh(end);
        mTr_result(ii+1)=mTr(end);
        A_result(ii+1)=A(end);
        R_result(ii+1)=R(end);
        
        Mh_result(ii+1)=Mh(end);
        Mr_result(ii+1)=Mr(end);
        
              
        %init_list=[p.Th0,p.Tr0,p.mTh0,p.mTr0,p.Th_naive0,p.Tr_naive0,p.Th_memory0,p.Tr_memory0];
        init_list=[Th(end),Tr(end),mTh(end),mTr(end),Th_naive(end),Tr_naive(end),Th_memory(end),Tr_memory(end),R(end)];
        
%         pros=q-11;
%         disp(pros)
        
        
        
       
end

shrink_result=[T_result;Th_result;Tr_result;mTh_result;mTr_result;A_result;R_result;Mh_result;Mr_result];





end









