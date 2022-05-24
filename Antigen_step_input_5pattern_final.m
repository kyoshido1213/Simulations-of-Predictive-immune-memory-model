function Atot_step_5pattern=Antigen_step_input_5pattern_final(T,duration1,III1,input_num1,ts_init1,tau_up1,tau_down1,antigen_satu1,...
                                                                 duration2,III2,input_num2,ts_init2,tau_up2,tau_down2,antigen_satu2,...
                                                                 duration3,III3,input_num3,ts_init3,tau_up3,tau_down3,antigen_satu3,...
                                                                 duration4,III4,input_num4,ts_init4,tau_up4,tau_down4,antigen_satu4,...
                                                                 duration5,III5,input_num5,ts_init5,tau_up5,tau_down5,antigen_satu5)
                                                                
                                           
tt=ts_init1+III1*(input_num1-1)+duration1;
tt2=tt+ts_init2+III2*(input_num2-1)+duration2;
tt3=tt2+ts_init3+III3*(input_num3-1)+duration3;
tt4=tt3+ts_init4+III4*(input_num4-1)+duration4;


antigen_total=zeros(1,length(T));

for i=1:length(antigen_total)
    
    t=T(i);

    A1=antigen_sig_final(t,tau_up1,tau_down1,antigen_satu1,ts_init1,duration1);
    A2=antigen_sig_final(t,tau_up2,tau_down2,antigen_satu2,tt+ts_init2,duration2);
    A3=antigen_sig_final(t,tau_up3,tau_down3,antigen_satu3,tt2+ts_init3,duration3);  
    A4=antigen_sig_final(t,tau_up4,tau_down4,antigen_satu4,tt3+ts_init4,duration4);   
    A5=antigen_sig_final(t,tau_up5,tau_down5,antigen_satu5,tt4+ts_init5,duration5);    
    

    antigen_total(i)=A1.*(t<=tt+ts_init2)+A2.*(t>tt).*(t<=(tt2+ts_init3))+A3.*(t>tt2).*(t<=(tt3+ts_init4))+A4.*(t>tt3).*(t<=(tt4+ts_init5))+A5.*(t>(tt4+ts_init5));

end

Atot_step_5pattern=antigen_total;


end




