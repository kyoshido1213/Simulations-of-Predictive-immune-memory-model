function run_result=run_time_series_final_timedelay(p,dt,t_end,antigen_satu,tau_up,func_num,tau_delay)

Th0=p.Th0;Tr0=p.Tr0;mTh0=p.mTh0;mTr0=p.mTr0;
Th_naive0=p.Th_naive0;Th_memory0=p.Th_memory0;Tr_naive0=p.Tr_naive0;Tr_memory0=p.Tr_memory0;




mh=p.mh;mr=p.mr;beta=p.beta;
dh=p.dh;knh=p.knh;kmh=p.kmh;eh=p.eh;
dr=p.dr;knr=p.knr;kmr=p.kmr;er=p.er;
Tn=p.Tn;K2=p.K2;R0=p.R0;
rk=p.rk;ak=p.ak;br=p.br;
n_sig=p.n_sig;K_sig=p.K_sig;q_max_sig=p.q_max_sig;
n_step=p.n_step;K_step=p.K_step;q_max_step=p.q_max_step;



Dh=p.Dh;Dr=p.Dr;C=p.C;Bh=p.Bh;Br=p.Br;


%T=0:dt:t_end;
T_delay=0:dt:(t_end+tau_delay*dt);
A_delay_list=zeros(1,length(T_delay));
Th_temp_delay_list=zeros(1,length(T_delay));
Tr_temp_delay_list=zeros(1,length(T_delay));



%simulation
ts_init=0;
Antigen=antigen_satu*(1-exp(-(T_delay-ts_init)/tau_up));

Th=zeros(1,length(T_delay));
Tr=zeros(1,length(T_delay));
mTh=zeros(1,length(T_delay));
mTr=zeros(1,length(T_delay));
Th_naive=zeros(1,length(T_delay));
Tr_naive=zeros(1,length(T_delay));
Th_memory=zeros(1,length(T_delay));
Tr_memory=zeros(1,length(T_delay));
Mh_list=zeros(1,length(T_delay));
Mr_list=zeros(1,length(T_delay));
R=zeros(1,length(T_delay));

Th(1)=Th0;
Tr(1)=Tr0;
mTh(1)=mTh0;
mTr(1)=mTr0;
Th_naive(1)=Th_naive0;
Tr_naive(1)=Tr_naive0;
Th_memory(1)=Th_memory0;
Tr_memory(1)=Tr_memory0;
Mh_list(1)=0;
Mr_list(1)=0;
R(1)=R0;


for i=2:length(T_delay)

   
    Th_temp=Th(i-1);
    Tr_temp=Tr(i-1);
    mTh_temp=mTh(i-1);
    mTr_temp=mTr(i-1);
    Th_naive_temp=Th_naive(i-1);
    Tr_naive_temp=Tr_naive(i-1);
    Th_memory_temp=Th_memory(i-1);
    Tr_memory_temp=Tr_memory(i-1);
    R_temp=R(i-1);


    A=Antigen(i);
    
   %delay
    
    if i-tau_delay-1>0
        Th_temp_delay=Th(i-tau_delay-1);
        Tr_temp_delay=Tr(i-tau_delay-1);
    else
        Th_temp_delay=0;
        Tr_temp_delay=0;
    end
    
    Th_temp_delay_list(i)=Th_temp_delay;
    Tr_temp_delay_list(i)=Tr_temp_delay;
    
    
    if i-tau_delay-1>0
        A_delay=Antigen(i-tau_delay-1);
    else
        A_delay=0;
    end
    
    A_delay_list(i)=A_delay;
    
    

    f1_Th=mh*Th_temp_delay;
    f2_Th=beta*(Th_temp_delay/(Th_temp_delay+K2));

    Mh_list(i)=eh*max(0,A_delay-f1_Th);
    Mh=Mh_list(i);
    
 
    Mr_list(i)=er*max(0,f2_Th-A_delay-mr*Tr_temp_delay);
    Mr=Mr_list(i);
    
    
    if func_num==1
        Ha_Th=A;
        Ha_Tr=A;
    elseif func_num==2
        Ha_Th=q_max_sig*(A^n_sig/(A^n_sig+K_sig^n_sig));
        Ha_Tr=q_max_sig*(A^n_sig/(A^n_sig+K_sig^n_sig));
    elseif func_num==3
        Ha_Th=q_max_step*(A^n_step/(A^n_step+K_step^n_step));
        Ha_Tr=q_max_step*(A^n_step/(A^n_step+K_step^n_step));
    end
    
    
    %ODE
    dTh_dt=(-dh+(Dh/(C+Bh*Tr_temp)))*Th_temp+knh*Tn*Ha_Th+kmh*mTh_temp*Ha_Th-Mh*Th_temp;
    dmTh_dt=Mh*Th_temp_delay;
    dTh_naive_dt=(-dh+(Dh/(C+Bh*Tr_temp)))*Th_naive_temp+knh*Tn*Ha_Th-Mh*Th_temp;
    dTh_memory_dt=(-dh+(Dh/(C+Bh*Tr_temp)))*Th_memory_temp+kmh*mTh_temp*Ha_Th-Mh*Th_temp;
    
    dTr_dt=(-dr+(Dr/(C+Br*Th_temp)))*Tr_temp+knr*Tn*Ha_Tr+kmr*mTr_temp*Ha_Tr-Mr*Tr_temp;
    dmTr_dt=Mr*Tr_temp_delay;
    dTr_naive_dt=(-dr+(Dr/(C+Br*Th_temp)))*Tr_naive_temp+knr*Tn*Ha_Tr-Mr*Tr_temp;
    dTr_memory_dt=(-dr+(Dr/(C+Br*Th_temp)))*Tr_memory_temp+kmr*mTr_temp*Ha_Tr-Mr*Tr_temp;
    
    dR_dt=-(rk+ak*Tr_temp)*R_temp+br*Th_temp;
    
    
    
    %renewal
    Th_temp=Th_temp+dTh_dt*dt;
    mTh_temp=mTh_temp+dmTh_dt*dt;
    Th_naive_temp=Th_naive_temp+dTh_naive_dt*dt;
    Th_memory_temp=Th_memory_temp+dTh_memory_dt*dt;
    
    Tr_temp=Tr_temp+dTr_dt*dt;
    mTr_temp=mTr_temp+dmTr_dt*dt;
    Tr_naive_temp=Tr_naive_temp+dTr_naive_dt*dt;
    Tr_memory_temp=Tr_memory_temp+dTr_memory_dt*dt;
    
    R_temp=R_temp+dR_dt*dt;
    

    Th(i)=Th_temp;
    mTh(i)=mTh_temp;
    Th_naive(i)=Th_naive_temp;
    Th_memory(i)=Th_memory_temp;
    
    Tr(i)=Tr_temp;
    mTr(i)=mTr_temp;
    Tr_naive(i)=Tr_naive_temp;
    Tr_memory(i)=Tr_memory_temp;
    
    R(i)=R_temp;


end


run_result=[T_delay;Th;Tr;mTh;mTr;Th_naive;Tr_naive;Th_memory;Tr_memory;Mh_list;Mr_list;Antigen;R;A_delay_list;Th_temp_delay_list;Tr_temp_delay_list];



end


