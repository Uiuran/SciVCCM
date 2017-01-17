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

function current = evaluateCurrent(t,x,current,param)
    
    select current.Ion

    case "Na" then
        
        [current.I,current.Im,current.Ih] = naCurrent(t,x(1),x(2),x(3),param);
        
    case "NaF" then
        
        [current.I,current.Ih] = NaFastCurrent(t,x(1),x(2),param);

    case "Kp" then
        
        [current.I,current.In] = kPersistCurrent(t,x(1),x(2),param);
    
    case "Ks" then
        
        [current.I,current.Isn] = kSlowCurrent(t,x(1),x(2),param);
     
    case "L" then
    
        current.I = lCurrent(t,x(1),param);        
    
    else
    
    errmsg = sprintf("Unknown Channel %s",current.Ion);
    error(errmsg)    
    end
    
endfunction
