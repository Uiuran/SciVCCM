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

function current = createCurrent(channeltype)

    select channeltype

    case "Na" then

        current = tlist(["TL_NAGATE","I","Im","Ih","gNum","Ion"]);
        current.I = 0;
        current.Im = 0;
        current.Ih = 0;
        current.gNum = 2;
        current.Ion = "Na";
        
    case "NaF" then

        current = tlist(["TL_NAGATE","I","Ih","gNum","Ion"]);
        current.I = 0;
        current.Ih = 0;
        current.gNum = 1;
        current.Ion = "NaF";
        
    case "Kp" then
        
        current = tlist(["T_KPGATE","I","In","gNum","Ion"]);
        current.I = 0;
        current.In = 0;
        current.gNum = 1;
        current.Ion = "Kp";
        
    case "Ks" then
        
        current = tlist(["T_KSGATE","I","Isn","gNum","Ion"]);
        current.I = 0;
        current.Isn = 0;
        current.gNum = 1;
        current.Ion = "Ks";
    
    case "L" then
    
        current = tlist(["T_LEAKY","I","gNum","Ion"]);
        current.I = 0;
        current.gNum = 0;
        current.Ion = "L";
    
    else
    
    errmsg = sprintf("Unknown Channel %s",channeltype);
    error(errmsg)    
    
    end

endfunction

function [all]=createAllCurrent(currents)
    
    Inum = size(currents);
    all = list();
    for i = 1:Inum(1)
        all(i) = createCurrent(currents(i));
    end

    
endfunction
