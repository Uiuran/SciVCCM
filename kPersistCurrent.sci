function[Ikp,In]= kPersistCurrent(t,v,n,param)
Ikp= param.g_Kp*(n^4)*(v-param.E_Kp);
In= aclosedstate(v,param.vrest,param.nc)*(1-n)-aopenstate(v,param.vrest,param.no)*n; //Gate n of the potassium K channel, the only one that decides if the channels open or closes
endfunction
