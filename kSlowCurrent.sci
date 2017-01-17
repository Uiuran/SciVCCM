function [Iks,Isn]=kSlowCurrent(t,v,n,param)
Iks = param.g_Ks*(n^2)*(v-param.E_Ks);
Isn = (f(v,param.ks)- n )/param.T_ks; //Gate n of activation of sodium Na channel
endfunction
