![image](https://github.com/kyoshido1213/Simulations-of-Predictive-immune-memory-model/assets/105700190/3c69f6f1-0fa8-48df-a8c1-8f62a4c70f2f)# Simulations-of-Predictive-immune-memory-model
This repository includes codes for simulations of predictive immune memory model proposed in "Adaptive discrimination of antigen risk by predictive coding in immune system." written by Kana Yoshido and Honda Naoki.


# Usage
1. To get started, download the project in this repository in your Terminal.

```
    git clone https://github.com/kyoshido1213/Simulations-of-Predictive-immune-memory-model.git　　　　
```

2. Move or copy [simulation_codes](simulation_codes) in Simulations-of-Predictive-immune-memory-model into the directory where you want to run MATLAB.

3. Main function is `simulation_all.m` . You can run all simulations of predictive immune memory model as shown in "Adaptive discrimination of antigen risk by predictive coding in immune system".

   For simulation of the parameter sensitivity analysis, you can run `sim_parameter_sensitivity_analysis.m` in [paramter_sensitivity_analysis](paramter_sensitivity_analysis).
   For simulation with a time delay in memory formation, you can run `simulation_all_time_delay.m` in [time_delay_in_memory_formation](time_delay_in_memory_formation).


# Note
* I used three kinds of parameter sets (`get_para_final_new.m`,`get_para_final_new_fig4.m`,`get_para_final_new_fig5.m`).
  These parameters are different only in the parameters of antigen input in immunotherapy, so all other parameters are identical in the three parameter setting.
* If you want to know predictive immune memory model in detail, please check: Kana Yoshido and Honda Naoki. "Adaptive discrimination of antigen risk by predictive coding in immune system" (doi: [https://doi.org/10.1101/2021.12.12.472285](https://doi.org/10.1101/2021.12.12.472285)
