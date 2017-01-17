function [Ina,Ih]=NaFastCurrent(t,v,h,param)
Ina = param.g_Na*h*(v-param.E_Na)*(f(v,param.Na_amp))^3;
Ih = (f(v,param.nc_Na)-h)/param.TNa; //Gate m of activation of sodium Na channel
endfunction