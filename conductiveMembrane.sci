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
//    Description: multivariated function for the currents object, where each current is evaluated
//    for its main contribution on the membrane circuit in currents(i)(2) and the tax of evolution
//    for each gate is evaluated in currents(i)(3:$-2). 
//        
//    y = conductiveMembrane(t,x,currents,param):=  t is time variable, x is a column vector
//    with the initial membrane voltage x(1) = V_0, and subsequent x(2:$) = gates respective
//    to the gates of each channel in currents (in the same order of the vector currents) 
//

function [currents] = conductiveMembrane(t,x,currents,param)
    
    Inum = size(currents); //objeto corrente esta redundante com relacao ao output 
    cont = 1;

// Evaluate the multi-variated function for the currents and for the gates of each channel //

    for i = 1:Inum
        channel_input = [x(1);];  // V_0 initial voltage
        
	    for j = 1:currents(i).gNum
	        cont = cont + 1;
            channel_input = [channel_input;x(cont);];
        end

        currents(i) = evaluateCurrent(t,channel_input,currents(i),param);                 

    end
//----//
        
endfunction
