function para=get_para_final_for_check


%initial condition
para.Th0=0;
para.mTh0=0;
para.Th_naive0=0;
para.Th_memory0=0;
para.Tr0=0;
para.mTr0=0;
para.Tr_naive0=0;
para.Tr_memory0=0;
para.R0=0;

%prediction error
para.mh=1;
para.mr=1;
para.K2=1;
para.beta=100;


%parameters
Qh=1*100;
para.dh=1*Qh;
para.knh=1/100*Qh;
para.kmh=0.04*Qh;
para.eh=0.01/100;

Qr=10;
para.dr=1*Qr;
para.knr=1/100*Qr/10;
para.kmr=0.04*Qr;
para.er=0.01/100*3;


para.Tn=1;
para.nTr=10;
para.Ka=1;

%parameters of proliferation
para.Dh=1;
para.Dr=1;
para.C=1;
para.Bh=1;
para.Br=1;


%dose-response type
%step
para.n_step=8;
para.K_step=10;
para.q_max_step=10;

%sigmoid
para.n_sig=4;
para.K_sig=30;
para.q_max_sig=10;



%intensity dynamics
% dR_dt=-(p.rk+p.ak*Tr_temp)*R_temp+p.br*Th_temp;
para.rk=para.nTr/100/10;
para.ak=10/100/10;
para.br=10/10/100;


%%history dependent input (simulation of immunotherapy)%%
%2nd input
para.antigen_st2=20/2*2;
para.duration2=((3000/2*3+1200)*1.5-1200+3000)*2/4/4*(2/3);
para.input_num2=1; 
para.III2=50*0;
para.ts_init2=500;
para.sig_num2=3;


%1st input
para.antigen_st1=200;
para.duration1=300*2*2*1.5/2/4/4*2;
para.input_num1=1; 
para.III1=50*2*0;
para.ts_init1=1000/2/2;
para.sig_num1=3;


%3rd input
para.antigen_st3=para.antigen_st1;
para.duration3=para.duration1;
para.input_num3=para.input_num1; 
para.III3=para.III1*0;
para.ts_init3=500;
para.sig_num3=para.sig_num1;


%4th input
para.antigen_st4=800;
para.duration4=para.duration1;
para.input_num4=para.input_num1; 
para.III4=para.III3;
para.ts_init4=2000/2/2;
para.sig_num4=para.sig_num1;


%5th input
para.antigen_st5=para.antigen_st3;
para.duration5=para.duration3;
para.input_num5=1; 
para.III5=para.III3*0;
para.ts_init5=2000/2/2;
para.sig_num5=para.sig_num3;

%time constant of antigen input
para.tau_up1=1;
para.tau_down1=1;
para.tau_up2=1;
para.tau_down2=1;
para.tau_up3=1;
para.tau_down3=1;
para.tau_up4=1;
para.tau_down4=1;
para.tau_up5=1;
para.tau_down5=1;



end