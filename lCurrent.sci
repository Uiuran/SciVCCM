function [Il] = lCurrent(t,v,param)
    
Il = param.g_L*(v-param.E_L);
    
endfunction