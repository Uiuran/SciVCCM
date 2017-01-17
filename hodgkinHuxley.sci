// Scilab Voltage Clamped Conductive Membrane rotines package 
//    Copyleft (C) 2012 &o00oo00o&
//			   P
// 			 _/\/\_
//    This program is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//   (at your option) any later version.
//
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
//    Sourceforge: https://sourceforge.net/p/scivccm

//Deprecated

/// Hodgkin Huxley like function for dynamical system of a excitable membrane, case of Na channels with 4 gates, 3 activation 1 innactivation. K channel with 4 gates of same kind and a Leaky channel without gate but constant capacitance, i.e, accounts for others channels within the membrane that are not voltage gated but transfer currents

function [y] = hodgkinHuxley(t,x,param)
    y(1)= (I(t,0,20,0,5)-param.g(1)*(x(2)^3)*x(3)*(x(1)-param.E(1))-param.g(2)*(x(4)^4)*(x(1)-param.E(2)) -param.g(3)*(x(1)-param.E(3)) )/param.C; //Kirchoff law for the membrane with Leaky Na - K
    y(2)=aclosedstate(x(1),param.vrest,param.mc)*(1-x(2))-aopenstate(x(1),param.vrest,param.mo)*x(2); //Gate m of activation of sodium Na channel
    y(3)=inaclosedstate(x(1),param.vrest,param.hc)*(1-x(3))-inaopenstate(x(1),param.vrest,param.ho)*x(3); //Gate h of in-activation of sodium Na channel
    y(4)=aclosedstate(x(1),param.vrest,param.nc)*(1-x(4))-aopenstate(x(1),param.vrest,param.no)*x(4); //Gate n of the potassium K channel, the only one that decides if the channels open or closes

endfunction

function [y] = aclosedstate(x,vrest,params)
    y=params(1)*((params(2)-x+vrest)/(exp((params(3)-x+vrest)/params(4))-1));
endfunction


function [y] = aopenstate(x,vrest,params)
    y=params(1)*exp((-x+vrest)/params(2));
endfunction

function [y] = inaclosedstate(x,vrest,params)
    y=params(1)*exp((-x+vrest)/params(2));
endfunction

function [y] = inaopenstate(x,vrest,params)
    y=1/(exp((params(1)-x+vrest)/params(2))+1);
endfunction

function [y] = I(t,order,period,coef,duration)
    
    if duration ~= 0 | duration < 1000 then

    if order == -1 then
        
        if t-modulo(t/period,1)*period < t & t < t-modulo(t/period,1)*20 + duration then
            y = coef;
        else
            y=0;
        end
        
    elseif order == 0 then
    
        y = coef;    
        
    elseif order == 1 then
       
        y = coef*t;             
        
    end

elseif duration == 0 then
    
    if order == -1 then
        
        if modulo(floor(t),period) == 0 then
            y = coef;
        else
            y=0;
        end
        
    elseif order == 0 then
    
        y = coef;    
        
    elseif order == 1 then
       
        y = coef*t;             
        
    end
    
else
    
    y = 0;
    
end
    
endfunction
