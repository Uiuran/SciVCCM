function [Ina,Im,Ih]=naCurrent(t,v,m,h,param)
Ina = param.g_Na*(m^3)*h*(v-param.E_Na);
Im = aclosedstate(v,param.vrest,param.mc)*(1-m)-aopenstate(v,param.vrest,param.mo)*m; //Gate m of activation of sodium Na channel
Ih=  inaclosedstate(v,param.vrest,param.hc)*(1-h)-inaopenstate(v,param.vrest,param.ho)*h; //Gate h of in-activation of sodium Na channel
endfunction