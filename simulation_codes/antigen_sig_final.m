function each_input=antigen_sig_final(t,tau_up,tau_down,antigen_satu,ts_init,duration)


te=ts_init+duration;


    
if (ts_init<=t)&&t<te
    each_input=antigen_satu*(1-exp(-(t-ts_init)/tau_up));
elseif t>=te
    each_input=antigen_satu*(1-(1-exp(-(t-te)/tau_down))).*(1-exp(-(te-ts_init)/tau_up));
else
    each_input=0;

end
    

end

