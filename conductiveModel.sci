// Scilab Voltage Clamped Conductive Membrane rotines package 
//    Copyleft (C) 2012 &o00oo00o&
//                         P
//                       _/\/\_
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
//
//    Description: Model of conductive membrane evaluated by the sum of the
//    total contribuition of ionic channels in a circuit, through a kirchoff law
//    like equation, with input current I. The outputs are given: y(1) voltage variable,
//    y(2:$) gate variables.
//
//    y = conductiveModel(t, x, currents, externalcurrent, param):= t is the time variable, x are the initial conditions,
//    currents is a vector of currents, created by the functions createCurrent('type') or createAllCurrent(['type1';'type2';...]),
//    externalcurrent is the input current from external source and param are the parameters given by vclamp.sci
//
//    Externalcurrent must be a four dimensional column vector with the following members: first(1) is the current type tag, currently
//    available is -1 for periodic impulse, 0 for constant impulse, 1 for time-linear grow impulse, second(2) is the periodicity of the impulse,
//    third(3) is the intensity of the current and forth(4) is the duration of the impulse.

function [y] = conductiveModel(t,x,currents,externalcurrent,param)

        [currents] = conductiveMembrane(t,x,currents,param);
	l = length(currents);        
	gnum_in = length(x)-1;
	gnum_real = 0;
        ecs = size(externalcurrent);
        if ecs(1) ~= 4 then
            error('wrong number of external input current arguments, must be 4');
        end

// Compare number of initial gate arguments with number of actual gates given in currents argument //
        for i=1:l
     	   gnum_real = gnum_real + currents(i)($-1);
        end

        if gnum_in ~= gnum_real then
        	error('imcompatible number of input gates');
    	end
//----// 

	y(1) = I(t,externalcurrent(1),externalcurrent(2),externalcurrent(3),externalcurrent(4));
	c = 1;
      
//  Kirchoff circuit evaluation //
	for i=1:l

		y(1) = y(1) - currents(i)(2);	
		for j = 1:currents(i)($-1);
		c = c + 1;
		y(c) = currents(i)(2+j);
		end

	end
	
	y(1) = y(1)/param.C;
//----//
        
endfunction

