//Private: (in)active gate state function. These non-linear function models the ode of gate probabilities, 
// one can make use of them to obtain the time scale and the clamped steady state, both functions of the 
// membrane Voltage x.

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

function [y] = f(x,params)
    y=1/(exp((-x+params(2))/params(1))+1);
endfunction

function [y] = I(t,order,period,coef,duration)
    
    if duration > 0 & duration <= 1000 then

    if order == -1 then
        
        if t-modulo(t/period,1)*period < t & t < t-modulo(t/period,1)*period + duration then

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
